import { addSelectedId } from "app/chatSlice";
import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { DefaultName } from "utils/Constants";
import { ChatType } from "utils/Enums";
import { formatDate } from "utils/UtilityMethods";
import CreateChat from "../CreateChat";

function ChatList({ className, setChatNotificationNumber, setIsOpen }) {
  const currentUser = useSelector((state) => state.users.currentUser);
  const chats = useSelector((state) => state.chats.chats);

  const [keyword, setKeyword] = useState("");
  const [isOpenCreateChat, setIsOpenCreateChat] = useState(false);

  const dispatch = useDispatch();

  useEffect(() => {
    if (chats) {
      const num = chats.reduce((preNum, x) => {
        return preNum + (x?.numOfUnreadMessages > 0 ? 1 : 0);
      }, 0);
      setChatNotificationNumber(num);
    }
  }, [chats]);

  function handleClick(id) {
    const action = addSelectedId(id);
    dispatch(action);
    setIsOpen(false);
  }

  return (
    <>
      <CreateChat isOpen={isOpenCreateChat} setIsOpen={setIsOpenCreateChat} />
      <div
        className={
          className +
          " " +
          "bg-white dark:bg-dark-secondary shadow-lg rounded-xl px-2 md:px-4 pt-3 md:pt-4 pb-2 border dark:border-dark-hover"
        }
      >
        <div className="relative ">
          <div className="flex space-x-2 justify-between items-center mb-3 ">
            <input
              type="search"
              className="rounded-3xl bg-gray-100 px-4 pl-10 pr-3 py-2 focus:ring-2 focus:ring-green-400 focus:ring-opacity-50 outline-none transition-base w-full dark:bg-dark-third dark:text-white"
              placeholder="Search TeeChat!"
              onChange={(e) => setKeyword(e.target.value)}
            />
            <ClickableIcon
              iconClass="bx bxs-edit"
              onClick={() => setIsOpenCreateChat(true)}
              className="dark:bg-dark-third bg-gray-100"
            />
          </div>
          <i className="bx bx-search absolute text-xl top-1/2 left-3 transform -translate-y-1/2 text-gray-400 cursor-pointer"></i>
        </div>

        <div className="max-h-450 overflow-y-auto pr-2 md:pb-0">
          {chats &&
            getCurrentChats(chats, keyword).map((chat, index) => {
              const currentUserName = currentUser.userName;

              // check current user still exist in chat (remove participant case)
              var isValid = chat?.participants.some(
                (x) => x.userName === currentUserName,
              );
              if (!isValid) {
                return;
              }

              const friend =
                chat?.participants.length > 1
                  ? chat?.participants
                      ?.filter((x) => x.userName !== currentUserName)
                      .shift()
                  : currentUser;
              let lastMessage = {};
              if (chat.messages?.length !== 0) {
                lastMessage = chat.messages?.reduce((a, b) =>
                  a?.dateCreated > b?.dateCreated ? a : b,
                );
              }
              return (
                <div
                  key={chat.id}
                  className="relative select-none w-full h-16 flex flex-start items-center cursor-pointer hover:bg-gray-100 p-2 rounded-lg transition-base dark:hover:bg-dark-third dark:text-dark-txt"
                  onClick={() => handleClick(chat.id)}
                >
                  {chat.numOfUnreadMessages > 0 && (
                    <span className="w-6 h-6 absolute right-2 top-1/2 text-xs font-bold p-1 bg-green-500 dark:bg-green-600 text-white rounded-full text-center align-middle">
                      {chat.numOfUnreadMessages > 9
                        ? "9+"
                        : chat.numOfUnreadMessages}
                    </span>
                  )}
                  <ImageCircle
                    src={
                      chat?.type === ChatType.PRIVATE
                        ? friend?.avatarUrl
                        : chat?.groupAvatarUrl
                    }
                    participants={chat?.participants}
                  />

                  <div className="font-primary flex flex-col pl-3 justify-between items-start h-full truncate w-full">
                    <div className="flex justify-between items-center w-full min-w-0 space-x-3">
                      <span
                        className={
                          "text-gray-800 truncate dark:text-dark-txt" +
                          " " +
                          (chat.numOfUnreadMessages > 0 ? "font-bold" : "")
                        }
                      >
                        {chat?.type === ChatType.PRIVATE
                          ? friend?.fullName
                          : chat?.name ?? DefaultName.NO_NAME_GROUP}
                      </span>
                      <span className="text-sm text-gray-500 truncate flex-shrink-0">
                        {formatDate(
                          lastMessage?.dateCreated ?? chat?.dateCreated,
                        )}
                      </span>
                    </div>
                    <div className="flex">
                      <span
                        className={
                          "mr-2 text-sm text-gray-500 truncate overflow-hidden flex-grow" +
                          " " +
                          (chat.numOfUnreadMessages > 0
                            ? "font-bold mr-10"
                            : "")
                        }
                      >
                        {lastMessage.content
                          ? lastMessage.content
                          : lastMessage.imageUrl
                          ? "Sent an image"
                          : ""}
                      </span>
                    </div>
                  </div>
                </div>
              );
            })}
          {chats.length < 1 && (
            <div className="pt-3 pb-4 w-full text-center font-semibold">
              Not found any chats. Start a chat now!
            </div>
          )}
        </div>
        <a
          href={process.env.REACT_APP_CHAT_APP_URL}
          target="_blank"
          rel="noreferrer"
          className="font-semibold text-center text-sm text-green-500 hover:text-green-600 cursor-pointer block px-2 pt-2 mt-2 border-t-2 border-gray-100 dark:border-dark-third transition-base"
        >
          See all in TeeChat!
        </a>
      </div>
    </>
  );
}

export default ChatList;

function getCurrentChats(chats, keyword) {
  var result = sortChat(chats);
  result = searchChat(result, keyword);
  return result;
}

function sortChat(chats) {
  if (chats) {
    return [...chats].sort((chatA, chatB) => {
      let lastMessageA = {};
      let lastMessageB = {};
      // check if chat no message => return date created of chat
      if (chatA.messages?.length !== 0) {
        lastMessageA = chatA.messages?.reduce((a, b) => {
          return a?.dateCreated > b?.dateCreated ? a : b;
        });
      } else {
        lastMessageA.dateCreated = chatA?.dateCreated;
      }
      if (chatB.messages?.length !== 0) {
        lastMessageB = chatB.messages?.reduce((a, b) =>
          a?.dateCreated > b?.dateCreated ? a : b,
        );
      } else {
        lastMessageB.dateCreated = chatB?.dateCreated;
      }

      return lastMessageA?.dateCreated < lastMessageB?.dateCreated ? 1 : -1;
    });
  }
}

function searchChat(chats, keyword) {
  if (chats) {
    return chats.filter((chat) => {
      let isValid = chat?.participants.some((x) => {
        if (
          x.fullName.toLowerCase().includes(keyword.toLowerCase()) ||
          x?.userName.toLowerCase().includes(keyword.toLowerCase())
        ) {
          return true;
        }
        return false;
      });
      return (
        isValid || chat?.name?.toLowerCase().includes(keyword.toLowerCase())
      );
    });
  }
}
