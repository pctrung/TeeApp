import React, { useEffect, useRef, useState } from "react";
import Logo from "logo-circle.png";
import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import { Link, useHistory } from "react-router-dom";
import useDarkMode from "hooks/useDarkMode";
import ConfirmModal from "components/ConfirmModal";
import { setCurrentUser } from "app/userSlice";
import { useDispatch, useSelector } from "react-redux";
import Button from "components/Button";
import ChatList from "features/Chat/components/ChatList";
import NotificationList from "features/Header/components/NotificationList";
import useNotificationApi from "hooks/useNotificationApi";
import { refreshNotification } from "app/appSlice";

function Header({ user }) {
  const history = useHistory();
  const dispatch = useDispatch();
  const notificationApi = useNotificationApi();

  const [chatNotification, setChatNotification] = useState(0);
  const [notificationNumber, setNotificationNumber] = useState(0);
  const chats = useSelector((state) => state.chats.chats);
  const notifications = useSelector((state) => state.app.notifications);

  const { darkMode, setDarkMode } = useDarkMode();

  const [keyword, setKeyword] = useState("");

  const [isOpenChatList, setIsOpenChatList] = useState(false);
  const [isOpenNotificationList, setIsOpenNotificationList] = useState(false);
  const [isOpenMenu, setIsOpenMenu] = useState(false);
  const [confirmModal, setConfirmModal] = useState({
    isOpen: false,
    title: "",
    content: "",
    confirmButtonTitle: "",
  });

  const ref = useRef();

  useEffect(() => {
    if (notificationApi) {
      notificationApi.getAll().then((response) => {
        dispatch(refreshNotification(response));
      });
    }
  }, []);

  useEffect(() => {
    if (notifications.items) {
      var num = notifications.items.reduce((preNum, x) => {
        return preNum + (x?.isRead ? 0 : 1);
      }, 0);
      setNotificationNumber(num);
    }
  }, [notifications]);

  useEffect(() => {
    if (chats) {
      var num = chats.reduce((preNum, x) => {
        return preNum + (x?.numOfUnreadMessages > 0 ? 1 : 0);
      }, 0);
      setChatNotification(num);
    }
  }, [chats]);

  useEffect(() => {
    const checkIfClickedOutside = (e) => {
      // If the menu is open and the clicked target is not within the menu,
      // then close the menu
      if (isOpenMenu && ref.current && !ref.current.contains(e.target)) {
        setIsOpenMenu(false);
      }
      if (isOpenChatList && ref.current && !ref.current.contains(e.target)) {
        setIsOpenChatList(false);
      }
      if (
        isOpenNotificationList &&
        ref.current &&
        !ref.current.contains(e.target)
      ) {
        setIsOpenNotificationList(false);
      }
    };
    document.addEventListener("mousedown", checkIfClickedOutside);
    return () => {
      // Cleanup the event listener
      document.removeEventListener("mousedown", checkIfClickedOutside);
    };
  }, [isOpenMenu, isOpenNotificationList, isOpenChatList]);

  const search = (e) => {
    e.preventDefault();
    history.push("/search/" + keyword);
  };

  const goToProfile = (userName) => {
    history.push("/profile/" + userName);
  };
  function logout() {
    window.localStorage.removeItem("token");
    dispatch(setCurrentUser({}));

    history.push("/login");
  }

  function openConfirmModal(
    content,
    confirmButtonAction,
    confirmButtonTitle = "Yes",
    title,
  ) {
    const confirmModal = {
      isOpen: true,
      title: title,
      content: content,
      confirmButtonTitle: confirmButtonTitle,
      confirmButtonAction: confirmButtonAction,
    };
    setConfirmModal(confirmModal);
  }

  return (
    <>
      {confirmModal.isOpen && (
        <ConfirmModal
          isOpen={confirmModal.isOpen}
          closeAction={() => setConfirmModal({ isOpen: false })}
          title="Are you sure?"
          content={confirmModal.content}
          confirmButtonTitle={confirmModal.confirmButtonTitle}
          confirmButtonAction={confirmModal.confirmButtonAction}
        />
      )}
      <div className="fixed top-0 bg-white dark:bg-dark-secondary dark:text-white w-screen p-2 shadow z-20">
        <div className="container mx-auto flex justify-between items-center">
          <div className="flex space-x-4 flex-shrink-0">
            <Link to="/">
              <img src={Logo} alt="Logo" className="h-10 w-10 cursor-pointer" />
            </Link>
            <ClickableIcon iconClass="bx bx-search" className="md:hidden" />
            <form
              onSubmit={(e) => search(e)}
              className="relative  md:block hidden"
            >
              <input
                type="search"
                className="bg-gray-100 dark:bg-dark-third dark:text-white rounded-full outline-none pl-10 pr-3 py-2 focus:ring-2 ring-green-400 ring-opacity-50 transition-base select-none"
                placeholder="Search TeeApp!"
                value={keyword}
                onChange={(e) => setKeyword(e.target.value)}
              />
              <i className="bx bx-search absolute text-xl top-1/2 left-3 transform text-gray-400 -translate-y-1/2 cursor-pointer"></i>
            </form>
          </div>
          {user.userName ? (
            <ul className="flex items-center space-x-2" ref={ref}>
              <li
                className="active:transform active:scale-95 p-1 h-full rounded-full flex items-center dark:hover:bg-dark-third hover:bg-gray-200 transition-base cursor-pointer select-none mr-3"
                onClick={() => goToProfile(user.userName)}
              >
                <ImageCircle src={user.avatarUrl} size="sm" />
                <span className="px-2 font-semibold">{user.firstName}</span>
              </li>
              <li className="relative">
                <ClickableIcon
                  className={
                    "p-2 " +
                    " " +
                    (isOpenChatList
                      ? "bg-green-100 hover:bg-green-200 active:bg-green-300 dark:bg-green-100"
                      : "")
                  }
                  iconClass="bx bxs-message-rounded-dots"
                  colorClass={
                    isOpenChatList
                      ? "bg-green-100 hover:bg-green-200 active:bg-green-300 dark:bg-green-900 dark:hover:bg-green-800 dark:active:bg-green-700 "
                      : ""
                  }
                  colorIconClass={
                    isOpenChatList ? "text-green-600 dark:text-green-400" : ""
                  }
                  onClick={() => {
                    setIsOpenChatList(!isOpenChatList);
                    setIsOpenMenu(false);
                    setIsOpenNotificationList(false);
                  }}
                />
                {chatNotification > 0 && !isOpenChatList && (
                  <span className="w-4 h-4 absolute right-0 top-full transform -translate-y-3/4 text-tiny font-bold bg-green-500 dark:bg-green-600 text-white rounded-full text-center align-middle select-none">
                    {chatNotification > 9 ? "9+" : chatNotification}
                  </span>
                )}
              </li>
              <li className="relative">
                <span className="dark:bg-green-600"></span>
                <ClickableIcon
                  className="p-2"
                  colorClass={
                    isOpenNotificationList
                      ? "bg-green-100 hover:bg-green-200 active:bg-green-300 dark:bg-green-900 dark:hover:bg-green-800 dark:active:bg-green-700 "
                      : ""
                  }
                  iconClass="bx bxs-bell"
                  colorIconClass={
                    isOpenNotificationList
                      ? "text-green-600 dark:text-green-400"
                      : ""
                  }
                  onClick={() => {
                    setIsOpenChatList(false);
                    setIsOpenMenu(false);
                    setIsOpenNotificationList(!isOpenNotificationList);
                  }}
                />
                {notificationNumber > 0 && !isOpenNotificationList && (
                  <span className="w-4 h-4 absolute right-0 top-full transform -translate-y-3/4 text-tiny font-bold bg-green-500 dark:bg-green-600 text-white rounded-full text-center align-middle select-none">
                    {notificationNumber > 9 ? "9+" : notificationNumber}
                  </span>
                )}
              </li>
              <li>
                <div className="relative">
                  <ClickableIcon
                    iconClass="bx bx-caret-down"
                    colorClass={
                      isOpenMenu
                        ? "bg-green-100 hover:bg-green-200 active:bg-green-300 dark:bg-green-900 dark:hover:bg-green-800 dark:active:bg-green-700 "
                        : ""
                    }
                    colorIconClass={
                      isOpenMenu ? "text-green-600 dark:text-green-400" : ""
                    }
                    onClick={() => {
                      setIsOpenMenu(!isOpenMenu);
                      setIsOpenChatList(false);
                      setIsOpenNotificationList(false);
                    }}
                  />
                  {isOpenMenu && (
                    <div className="animate-fadeIn transition-base absolute top-full right-0 border border-gray-200 bg-white w-60 rounded-lg shadow-lg overflow-hidden p-2 dark:bg-dark-secondary dark:border-dark-hover mt-2 select-none z-30">
                      <button
                        className="flex items-center space-x-3 w-full pl-2 pr-4 py-2 rounded-md text-left hover:bg-gray-200 active:bg-gray-300 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                        onClick={() => setDarkMode(!darkMode)}
                      >
                        <span className="p-1 bg-gray-100 dark:bg-dark-hover rounded-full select-none">
                          <i
                            className={
                              "text-center-middle text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 bx " +
                              " " +
                              (darkMode ? " bx-sun" : " bx-moon")
                            }
                          ></i>
                        </span>
                        <span>{darkMode ? "Light Mode" : "Dark Mode"}</span>
                      </button>
                      <button
                        className="flex items-center space-x-3 w-full pl-2 pr-4 py-2 rounded-md text-left hover:bg-gray-200 active:bg-gray-300 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                        onClick={() => {
                          openConfirmModal("Do you want to log out?", logout);
                        }}
                      >
                        <span className="p-1 bg-gray-100 dark:bg-dark-hover rounded-full select-none">
                          <i className="text-center-middle bx bx-log-in-circle text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7"></i>
                        </span>
                        <span>Log Out</span>
                      </button>
                    </div>
                  )}
                  {isOpenChatList && (
                    <ChatList
                      chats={chats}
                      className="absolute animate-fadeIn top-full transform translate-y-3 right-0 lg:w-112 w-96 max-h-600 "
                    />
                  )}
                  {isOpenNotificationList && (
                    <NotificationList
                      notifications={notifications}
                      setIsOpen={setIsOpenNotificationList}
                      className="absolute animate-fadeIn top-full transform translate-y-3 right-0 lg:w-112 w-96 max-h-600 overflow-y-auto "
                    />
                  )}
                </div>
              </li>
            </ul>
          ) : (
            <>
              <div className="flex space-x-2 items-center">
                <Link to="/register">
                  <Button outline>Sign up</Button>
                </Link>
                <Link to="/login">
                  <Button>Log in</Button>
                </Link>
              </div>
            </>
          )}
        </div>
      </div>
    </>
  );
}

export default Header;
