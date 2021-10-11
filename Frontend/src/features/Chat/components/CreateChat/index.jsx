import { addSelectedId } from "app/chatSlice";
import Button from "components/Button";
import ImageCircle from "components/ImageCircle";
import useChatApi from "hooks/api/useChatApi";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import { useDisableBodyScroll } from "hooks/utils/useDisableBodyScroll";
import { useEscToClose } from "hooks/utils/useEscToClose";
import useUserApi from "hooks/api/useUserApi";
import React, { useEffect, useRef, useState } from "react";
import { useDispatch } from "react-redux";
import { DefaultName } from "utils/Constants";
import { ChatType } from "utils/Enums";
import { setIsLoading } from "app/appSlice";

function CreateChat({ isOpen, setIsOpen }) {
  const [selectedMode, setSelectedMode] = useState(ChatType.PRIVATE);
  const [isOpenUserList, setIsOpenUserList] = useState(false);
  const [isValidButton, setIsValidButton] = useState(false);
  const [groupName, setGroupName] = useState("");
  const [keyword, setKeyword] = useState("");
  const [userList, setUserList] = useState([]);
  const [selectedUsers, setSelectedUsers] = useState([]);

  const ref = useRef();
  const userListRef = useRef();

  const dispatch = useDispatch();

  const chatApi = useChatApi();
  const userApi = useUserApi();

  useDisableBodyScroll(isOpen);
  useEscToClose(setIsOpen);
  useCloseOnClickOutside(isOpen, setIsOpen, ref);
  useCloseOnClickOutside(isOpenUserList, setIsOpenUserList, userListRef);

  useEffect(() => {
    userApi.getUserList().then((response) => {
      if (response) {
        setUserList(response.items);
      }
    });
    return () => {
      setSelectedUsers([]);
      setGroupName("");
    };
  }, []);

  useEffect(() => {
    if (selectedMode === ChatType.GROUP) {
      var result = selectedUsers?.length >= 2 && groupName?.trim();
      setIsValidButton(result);
    } else if (selectedMode === ChatType.PRIVATE) {
      setIsValidButton(selectedUsers?.length !== 0 ? true : false);
    }
  }, [selectedUsers, groupName, selectedMode]);

  async function handleCreateGroup() {
    if (isValidButton) {
      if (selectedMode === ChatType.GROUP) {
        const request = {
          participantUserNames: selectedUsers.map((x) => x.userName),
          name: groupName,
        };
        chatApi.createGroupChat(request).then((response) => {
          if (response.id) {
            dispatch(addSelectedId(response.id));
          }
          setSelectedUsers([]);
          setGroupName("");
          setIsOpen(false);
        });
      } else if (selectedMode === ChatType.PRIVATE) {
        const request = {
          participantUserName: selectedUsers.map((x) => x.userName).shift(),
        };
        dispatch(setIsLoading(true));
        chatApi.createPrivateChat(request).then((response) => {
          if (response.id) {
            dispatch(addSelectedId(response.id));
          }
          setSelectedUsers([]);
          setGroupName("");
          setIsOpen(false);
        });
      }
    }
  }

  return isOpen ? (
    <div
      className="overlay grid place-items-center px-4 py-10 z-30"
      style={{ margin: 0 }}
    >
      <div
        ref={ref}
        className={
          "animate-swipeDown px-6 md:px-14 md:py-6 flex flex-col bg-white dark:bg-dark-secondary dark:border-dark-third rounded-xl shadow-xl border border-gray-300 w-full md:w-5/6 lg:w-2/5 transition-all duration-300 ease-in-out max-h-full overflow-y-auto md:overflow-visible" +
          " " +
          (isOpenUserList ? "mb-16" : "")
        }
      >
        <div className="flex pt-6 pb-5 justify-between h-full items-center">
          <h3 className="font-semibold text-lg md:text-2xl text-green-600 dark:text-green-400">
            New chat!
          </h3>

          <div className="relative flex rounded-lg items-center border border-green-500 cursor-pointer overflow-hidden">
            <div
              className={
                "absolute bg-gradient-to-br from-green-400 to-green-600 w-1/2 h-full rounded transition-base z-0" +
                " " +
                (selectedMode === ChatType.GROUP
                  ? "transform translate-x-full left-0"
                  : "left-0 ")
              }
            ></div>
            <span
              className={
                " px-3 py-2 z-10 text-xs md:text-sm select-none " +
                " " +
                (selectedMode === ChatType.PRIVATE
                  ? "text-white"
                  : " text-green-600 dark:text-green-400")
              }
              onClick={() => setSelectedMode(ChatType.PRIVATE)}
            >
              Private
            </span>
            <span
              className={
                " px-3 py-2 z-10 text-xs md:text-sm select-none " +
                " " +
                (selectedMode === ChatType.GROUP
                  ? "text-white"
                  : " text-green-600 dark:text-green-400")
              }
              onClick={() => setSelectedMode(ChatType.GROUP)}
            >
              Group
            </span>
          </div>
        </div>
        <div className="space-y-2 md:space-y-4">
          {selectedMode === ChatType.GROUP ? (
            <>
              <div className="space-y-2">
                <label
                  htmlFor="groupName"
                  className="font-semibold text-base md:text-lg dark:text-gray-200"
                >
                  Group name <span className="text-red-500">*</span>
                </label>
                <input
                  id="groupName"
                  value={groupName}
                  onChange={(e) => setGroupName(e.target.value)}
                  type="text"
                  className="dark:bg-dark-third bg-gray-100 rounded-lg w-full py-2 px-3 focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 outline-none transition-base mb-2 "
                />
              </div>
              <div ref={userListRef} className="space-y-2">
                <label
                  htmlFor="search"
                  className="font-semibold text-base md:text-lg dark:text-gray-200"
                >
                  Find Friends
                </label>
                <div className="relative">
                  <input
                    id="search"
                    type="search"
                    onFocus={() => setIsOpenUserList(true)}
                    value={keyword}
                    autoComplete="off"
                    onChange={(e) => setKeyword(e.target.value)}
                    className="dark:bg-dark-third bg-gray-100 rounded-lg w-full py-2 px-3 focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 outline-none transition-base mb-2 "
                  />
                  {isOpenUserList && (
                    <>
                      <div className="animate-fadeIn absolute top-full bg-white dark:bg-dark-secondary dark:border-dark-hover border border-gray-300 border-opacity-50 rounded-lg w-full py-2 md:py-4 md:px-8 px-6 space-y-1 max-h-36 md:max-h-72 overflow-y-auto select-none z-10 shadow-2xl">
                        <h4 className="font-semibold mb-2 dark:text-gray-200">
                          Friend list
                        </h4>
                        {userList
                          .filter(
                            (x) =>
                              (x.fullName
                                ?.toLowerCase()
                                .includes(keyword?.toLowerCase()) ||
                                x.userName
                                  ?.toLowerCase()
                                  .includes(keyword?.toLowerCase())) &&
                              !selectedUsers.some(
                                (selected) => selected.userName === x.userName,
                              ),
                          )
                          .sort((a, b) => a.fullName.localeCompare(b.fullName))
                          .map((friend, index) => (
                            <div
                              onClick={() => {
                                var result = [...selectedUsers];
                                if (
                                  !result.some(
                                    (x) => x.userName === friend.userName,
                                  )
                                ) {
                                  result.push(friend);
                                  setSelectedUsers(result);
                                }
                              }}
                              key={index + friend?.userName}
                              className="h-full w-full rounded-lg px-3 py-2 flex items-center space-x-2  dark:bg-dark-third bg-gray-100 hover:bg-green-200 dark:hover:bg-green-600 cursor-pointer transform active:scale-100 hover:scale-105 hover:shadow-xl transition-all duration-300 ease-in-out"
                            >
                              <ImageCircle
                                size="xs"
                                src={friend.avatarUrl}
                                userName={friend?.userName}
                              />
                              <span className="break-full w-full overflow-ellipsis truncate md:text-base text-sm">
                                {friend.fullName ?? DefaultName.NO_NAME_USER}
                              </span>
                            </div>
                          ))}
                      </div>
                    </>
                  )}
                </div>
              </div>
              <div className="space-y-2">
                <label
                  htmlFor="search"
                  className="font-semibold text-base md:text-lg dark:text-gray-200"
                >
                  Selected <span className="text-red-500">*</span>{" "}
                  <span className="text-sm text-gray-400">
                    {"(At least 2 people. Click to remove)"}
                  </span>
                </label>
                <div className="bg-white dark:bg-dark-secondary border dark:border-dark-hover border-gray-400 border-opacity-50 rounded-lg w-full py-4 md:px-8 px-6 space-y-1 max-h-48 md:max-h-72 overflow-y-auto select-none">
                  {selectedUsers
                    .sort((a, b) => a.fullName.localeCompare(b.fullName))
                    .map((friend, index) => (
                      <div
                        onClick={() => {
                          var result = [...selectedUsers];
                          var i = result.findIndex(
                            (x) => x.userName === friend.userName,
                          );
                          if (i >= 0) {
                            result.splice(i, 1);
                            setSelectedUsers(result);
                          }
                        }}
                        key={index + friend?.userName}
                        className="h-full w-full rounded-lg px-3 py-2 flex items-center space-x-2  dark:bg-dark-third bg-gray-100 hover:bg-red-200 dark:hover:bg-red-500 cursor-pointer transform active:scale-100 hover:scale-105 hover:shadow-xl transition-all duration-300 ease-in-out"
                      >
                        <ImageCircle
                          size="xs"
                          src={friend.avatarUrl}
                          userName={friend?.userName}
                        />
                        <span className="break-full w-full overflow-ellipsis truncate md:text-base text-sm">
                          {friend.fullName ?? DefaultName.NO_NAME_USER}
                        </span>
                      </div>
                    ))}
                </div>
              </div>
            </>
          ) : (
            <div ref={userListRef} className="space-y-2">
              <label
                htmlFor="selectFriend"
                className="font-semibold md:text-lg dark:text-gray-200"
              >
                Select Friends
              </label>
              <div className="relative">
                <input
                  id="selectFriend"
                  type="search"
                  onFocus={() => setIsOpenUserList(true)}
                  value={keyword}
                  autoComplete="off"
                  onChange={(e) => setKeyword(e.target.value)}
                  className="dark:bg-dark-third bg-gray-100 rounded-lg w-full py-2 px-3 focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 outline-none transition-base mb-2 "
                />
                {isOpenUserList && (
                  <>
                    <div className="animate-fadeIn absolute top-full bg-white dark:bg-dark-secondary border border-gray-400 border-opacity-50 rounded-lg w-full space-y-1 max-h-36 md:max-h-72 overflow-y-auto select-none z-10 shadow-2xl py-2 md:py-4 md:px-8 px-6">
                      <h4 className="font-semibold mb-2 text-start dark:text-gray-200">
                        Friend list
                      </h4>
                      {userList
                        ?.sort((a, b) => a.fullName.localeCompare(b.fullName))
                        ?.filter(
                          (x) =>
                            (x.fullName
                              ?.toLowerCase()
                              .includes(keyword?.toLowerCase()) ||
                              x.userName
                                ?.toLowerCase()
                                .includes(keyword?.toLowerCase())) &&
                            !selectedUsers.some(
                              (selected) => selected.userName === x.userName,
                            ),
                        )
                        .map((friend, index) => (
                          <div
                            onClick={() => {
                              var result = [];
                              result.push(friend);
                              setIsOpenUserList(false);
                              setSelectedUsers(result);
                            }}
                            key={index + friend?.userName}
                            className="h-full w-full rounded-lg px-3 py-2 flex items-center space-x-2  dark:bg-dark-third bg-gray-100 hover:bg-green-200 dark:hover:bg-green-600 cursor-pointer transform active:scale-100 hover:scale-105 hover:shadow-xl transition-all duration-300 ease-in-out"
                          >
                            <ImageCircle
                              size="xs"
                              src={friend.avatarUrl}
                              userName={friend?.userName}
                            />
                            <span className="break-full w-full overflow-ellipsis truncate text-sm md:text-base">
                              {friend.fullName ?? DefaultName.NO_NAME_USER}
                            </span>
                          </div>
                        ))}
                    </div>
                  </>
                )}
              </div>
              <div className="space-y-2">
                <label
                  htmlFor="search"
                  className="font-semibold md:text-lg dark:text-gray-200"
                >
                  Selected <span className="text-red-500">*</span>{" "}
                  <span className="text-sm text-gray-400">
                    {"(Click to remove)"}
                  </span>
                </label>
                <div className="bg-white dark:bg-dark-secondary border dark:border-dark-hover border-gray-400 border-opacity-50 rounded-lg w-full py-4 md:px-8 px-6 space-y-1 max-h-48 md:max-h-72 overflow-y-auto select-none ">
                  {[...selectedUsers].map((friend, index) => {
                    if (index === 0) {
                      return (
                        <div
                          onClick={() => {
                            var result = [...selectedUsers];
                            var i = result.findIndex(
                              (x) => x.userName === friend.userName,
                            );
                            if (i >= 0) {
                              result.splice(i, 1);
                              setSelectedUsers(result);
                            }
                          }}
                          key={index + friend?.userName}
                          className="h-full w-full rounded-lg px-3 py-2 flex items-center space-x-2  dark:bg-dark-third bg-gray-100 hover:bg-red-200 cursor-pointer transform active:scale-100 hover:scale-105 hover:shadow-xl transition-all duration-300 ease-in-out dark:hover:bg-red-500"
                        >
                          <ImageCircle
                            size="xs"
                            src={friend.avatarUrl}
                            userName={friend?.userName}
                          />
                          <span className="break-full w-full overflow-ellipsis truncate md:text-base text-sm">
                            {friend.fullName ?? DefaultName.NO_NAME_USER}
                          </span>
                        </div>
                      );
                    } else {
                      return <></>;
                    }
                  })}
                </div>
              </div>
            </div>
          )}
        </div>
        <div className="flex justify-end py-6 space-x-4">
          <div className="space-x-2 flex items-center">
            <Button outline content="Close" onClick={() => setIsOpen(false)} />
            <Button
              disabled={!isValidButton}
              content="Create"
              onClick={() => handleCreateGroup()}
            />
          </div>
        </div>
      </div>
    </div>
  ) : (
    ""
  );
}

export default CreateChat;
