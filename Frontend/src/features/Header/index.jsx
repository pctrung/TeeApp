import { refreshPost, resetNewPost } from "app/postSlice";
import { setCurrentUser } from "app/userSlice";
import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import ImageCircle from "components/ImageCircle";
import ChatList from "features/Chat/components/ChatList";
import NotificationList from "features/Header/components/NotificationList";
import { NavList } from "features/Header/utils/config";
import useAccountApi from "hooks/api/useAccountApi";
import usePostApi from "hooks/api/usePostApi";
import useUserApi from "hooks/api/useUserApi";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import useDarkMode from "hooks/utils/useDarkMode";
import { useDisableBodyScroll } from "hooks/utils/useDisableBodyScroll";
import { useEscToClose } from "hooks/utils/useEscToClose";
import Logo from "logo-circle.png";
import React, { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useLocation } from "react-router-dom";

function Header({ className }) {
  const history = useHistory();
  const dispatch = useDispatch();
  const location = useLocation();

  const user = useSelector((state) => state.users.currentUser);
  const isAdmin = user?.userName === "teeadmin";
  const newPostTotal = useSelector((state) => state.posts.newPostTotal);
  const userApi = useUserApi();
  const accountApi = useAccountApi();
  const postApi = usePostApi();

  const [chatNotificationNumber, setChatNotificationNumber] = useState(0);
  const [notificationNumber, setNotificationNumber] = useState(0);

  const { darkMode, setDarkMode } = useDarkMode();
  const [keyword, setKeyword] = useState("");

  const [isOpenNavBar, setIsOpenNavBar] = useState(false);
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
  const navBarRef = useRef();

  useEffect(() => {
    userApi.getCurrentUser().then((response) => {
      dispatch(setCurrentUser(response));
    });
  }, []);

  useCloseOnClickOutside(isOpenMenu, setIsOpenMenu, ref);
  useCloseOnClickOutside(isOpenChatList, setIsOpenChatList, ref);
  useCloseOnClickOutside(
    isOpenNotificationList,
    setIsOpenNotificationList,
    ref,
  );

  useEscToClose(setIsOpenNavBar);
  useDisableBodyScroll(isOpenNavBar);

  const search = (e) => {
    e.preventDefault();
    history.push("/search/" + keyword);
  };

  const goToProfile = (userName) => {
    history.push("/profile/" + userName);
    setKeyword("");
  };
  async function logout() {
    await accountApi.logout();
    window.localStorage.removeItem("token");
    window.location.href = process.env.PUBLIC_URL + "/";
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

  function goTo(route, isCurrentRoute) {
    if (isCurrentRoute) {
      window.scrollTo({
        top: 0,
        left: 0,
        behavior: "smooth",
      });
      dispatch(resetNewPost());
      postApi.getNewsFeed().then((response) => {
        dispatch(refreshPost(response));
      });
    } else {
      history.push(route);
    }
    setIsOpenNavBar(false);
    setKeyword("");
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
      {/* Dark mode toggle */}
      <div
        className="fixed bottom-4 left-4 items-center cursor-pointer z-50 hidden md:flex"
        onClick={() => setDarkMode(!darkMode)}
      >
        <i
          className={
            "bx p-2 dark:text-dark-txt text-gray-500 " +
            (darkMode ? "bx-moon" : "bx-sun")
          }
        ></i>
        <div className="relative">
          <div className="block bg-gray-600 w-10 h-6 rounded-full"></div>
          <div
            className={
              "absolute left-1 top-1 bg-white w-4 h-4 rounded-full transition-base transform " +
              (darkMode ? "translate-x-full bg-green600 dark:bg-green-400" : "")
            }
          ></div>
        </div>
      </div>
      <div
        className={
          "bg-white dark:bg-dark-secondary dark:text-white p-2 shadow border-b border-transparent dark:border-dark-hover z-20" +
          " " +
          className
        }
      >
        <div
          ref={ref}
          className="relative max-w-full md:max-w-screen-xl mx-auto flex justify-between items-center"
        >
          <div className="flex space-x-4 flex-shrink-0">
            <span onClick={() => goTo("/", location.pathname === "/")}>
              <img src={Logo} alt="Logo" className="h-10 w-10 cursor-pointer" />
            </span>
            <form
              onSubmit={(e) => search(e)}
              className="relative md:inline-block hidden"
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
          <div className="text-3xl text-green-500 md:flex hidden">
            {NavList.map((nav) => {
              const currentRoute = location.pathname;
              const isCurrentRoute = nav.route === currentRoute;
              const icon = isCurrentRoute ? nav.icon : nav.inactiveIcon;
              return (
                <div
                  key={nav.route}
                  className={
                    "relative group border-b-4 border-transparent" +
                    " " +
                    (nav.isMobile ? "block md:hidden" : "") +
                    " " +
                    (isCurrentRoute ? " border-green-500" : "")
                  }
                  onClick={() => goTo(nav.route, isCurrentRoute)}
                >
                  <i
                    className={`select-none py-1 px-4 md:py-2 md:px-6 rounded-lg hover:bg-gray-100 active:bg-gray-200 dark:hover:bg-dark-third dark:active:bg-dark-hover transition-base cursor-pointer  ${icon}`}
                  ></i>
                  <div className="select-none animate-fadeIn group-hover:block absolute top-full left-1/2 hidden bg-black dark:bg-white dark:bg-opacity-80 bg-opacity-60 px-1 rounded transform -translate-x-1/2 translate-y-2 text-white dark:text-black text-sm font-title p-1">
                    {nav.name}
                  </div>
                  {nav.name.toLowerCase() === "home" && newPostTotal > 0 && (
                    <span className="animate-fadeIn absolute top-1 right-1 bg-green-500 dark:bg-green-600 text-white rounded-full select-none text-xs font-bold w-3 h-3"></span>
                  )}
                </div>
              );
            })}
          </div>
          <ul className="flex items-center space-x-2">
            <li
              className={
                "active:transform active:scale-95 p-1 h-full rounded-full flex items-center  transition-base cursor-pointer select-none mr-3 " +
                (location.pathname === `/profile/${user.userName}`
                  ? "dark:bg-green-600 dark:bg-opacity-40 bg-green-100 text-green-600 dark:text-green-400 "
                  : "dark:hover:bg-dark-third hover:bg-gray-200")
              }
              onClick={() => goToProfile(user.userName)}
            >
              <ImageCircle src={user.avatarUrl} size="sm" />
              <span className="px-2 font-semibold truncate w-full">
                {user.firstName}
              </span>
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
              {chatNotificationNumber > 0 && !isOpenChatList && (
                <span className="animate-fadeIn w-4 h-4 absolute right-0 top-full transform -translate-y-3/4 text-tiny font-bold bg-green-500 dark:bg-green-600 text-white rounded-full text-center align-middle select-none">
                  {chatNotificationNumber > 9 ? "9+" : chatNotificationNumber}
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
                <span className="animate-fadeIn w-4 h-4 absolute right-0 top-full transform -translate-y-3/4 text-tiny font-bold bg-green-500 dark:bg-green-600 text-white rounded-full text-center align-middle select-none">
                  {notificationNumber > 9 ? "9+" : notificationNumber}
                </span>
              )}
            </li>

            <li className="md:inline hidden">
              <div className="relative">
                <ClickableIcon
                  className="p-2"
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
                  <div className="animate-fadeIn transition-base absolute top-full transform translate-y-1 right-0 border border-gray-200 bg-white w-60 rounded-lg shadow-lg overflow-hidden p-1 dark:bg-dark-secondary dark:border-dark-hover mt-2 select-none z-30">
                    {isAdmin && <button
                      className="flex items-center space-x-3 w-full pl-2 pr-4 py-2 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                      onClick={() => window.location.href = "/admin"}
                    >
                      <i className="text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 bx bx-lock-alt"></i>
                      <span>Admin page</span>
                    </button>}
                    <button
                      className="flex items-center space-x-3 w-full pl-2 pr-4 py-2 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                      onClick={() => setDarkMode(!darkMode)}
                    >
                      <i
                        className={
                          "text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 bx " +
                          " " +
                          (darkMode ? " bx-sun" : " bx-moon")
                        }
                      ></i>
                      <span>{darkMode ? "Light Mode" : "Dark Mode"}</span>
                    </button>
                    <button
                      className="flex items-center space-x-3 w-full pl-2 pr-4 py-2 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                      onClick={() => {
                        openConfirmModal("Do you want to log out?", logout);
                      }}
                    >
                      <i className="bx bx-log-in-circle text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7"></i>
                      <span>Log Out</span>
                    </button>
                  </div>
                )}
              </div>
            </li>
            <li className="md:hidden">
              <ClickableIcon
                className="p-2"
                iconClass="bx bx-menu"
                colorClass={
                  isOpenNavBar
                    ? "bg-green-100 hover:bg-green-200 active:bg-green-300 dark:bg-green-900 dark:hover:bg-green-800 dark:active:bg-green-700 "
                    : ""
                }
                colorIconClass={
                  isOpenNavBar ? "text-green-600 dark:text-green-400" : ""
                }
                onClick={() => {
                  setIsOpenNavBar(!isOpenNavBar);
                }}
              />
            </li>
          </ul>
          <ChatList
            setIsOpen={setIsOpenChatList}
            setChatNotificationNumber={setChatNotificationNumber}
            className={
              "absolute animate-fadeIn top-full transform translate-y-2 right-0 lg:w-112 md:w-96 w-full max-h-600 " +
              " " +
              (isOpenChatList ? "" : "hidden")
            }
          />
          <NotificationList
            setIsOpen={setIsOpenNotificationList}
            className={
              "absolute animate-fadeIn top-full transform translate-y-2 right-0 lg:w-112 md:w-96 w-full max-h-600 overflow-y-auto " +
              " " +
              (isOpenNotificationList ? "" : "hidden")
            }
            setNotificationNumber={setNotificationNumber}
          />
        </div>
      </div>
      {isOpenNavBar && (
        <>
          <div
            ref={navBarRef}
            className="text-gray-500 dark:text-dark-txt md:hidden w-screen fixed animate-swipeRight inset-0 bg-white dark:bg-dark-primary z-40 px-4 py-4 pt-5 flex flex-col space-y-3 outline-none cursor-pointer"
          >
            <div className="flex justify-end space-x-4">
              <div
                className="fixed bottom-8 left-8 flex items-center cursor-pointer "
                onClick={() => setDarkMode(!darkMode)}
              >
                <div className="relative">
                  <div className="block bg-gray-600 w-14 h-8 rounded-full"></div>
                  <div
                    class={
                      "absolute left-1 top-1 bg-white w-6 h-6 rounded-full transition-base transform " +
                      (darkMode
                        ? "translate-x-full bg-green600 dark:bg-green-400"
                        : "")
                    }
                  ></div>
                </div>
                <i
                  className={"bx p-2 " + (darkMode ? "bx-moon" : "bx-sun")}
                ></i>
              </div>
              <ClickableIcon
                className="p-2 w-10 h-10"
                iconClass="bx bx-x"
                onClick={() => setIsOpenNavBar(false)}
              />{" "}
            </div>
            <div className="flex flex-col w-full">
              {NavList.map((nav) => {
                const currentRoute = location.pathname;
                const isCurrentRoute = nav.route === currentRoute;
                const icon = isCurrentRoute ? nav.icon : nav.inactiveIcon;
                return (
                  <div
                    key={nav.route}
                    className={
                      "animate-swipeRight relative group w-full hover:bg-gray-200 active:bg-gray-200 dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg " +
                      (isCurrentRoute
                        ? "bg-gray-100 dark:bg-dark-secondary"
                        : "")
                    }
                    onClick={() => goTo(nav.route, isCurrentRoute)}
                  >
                    <div
                      className={
                        "flex space-x-4 text-2xl py-2 px-4 rounded-lg items-center " +
                        (isCurrentRoute
                          ? "font-bold text-green-500"
                          : "font-medium")
                      }
                    >
                      <i
                        className={`select-none py-1 px-2 text-3xl align-middle ${icon}`}
                      ></i>
                      <span className="">{nav.name}</span>
                    </div>
                    {nav.name.toLowerCase() === "home" && newPostTotal > 0 && (
                      <span className="animate-fadeIn absolute top-1 left-1 bg-green-500 dark:bg-green-600 text-white rounded-full select-none text-xs font-bold w-3 h-3"></span>
                    )}
                    {isCurrentRoute && (
                      <span className="animate-fadeIn absolute top-1/2 right-3 transform -translate-y-1/2 bg-green-500 dark:bg-green-600 text-white rounded-full select-none text-xs font-bold w-3 h-3"></span>
                    )}
                  </div>
                );
              })}
              <div
                className={
                  "animate-swipeRight w-full hover:bg-gray-100 active:bg-gray-200 dark:hover:bg-dark-third dark:active:bg-dark-hover "
                }
              >
                <div
                  className="flex space-x-4 text-2xl py-2 px-4 rounded-lg items-center font-medium"
                  onClick={() => {
                    openConfirmModal("Do you want to log out?", logout);
                  }}
                >
                  <i
                    className={`select-none py-1 px-2 text-3xl align-middle bx bx-log-in-circle`}
                  ></i>
                  <span>Log out</span>
                </div>
              </div>
            </div>
          </div>{" "}
        </>
      )}
    </>
  );
}

export default Header;
