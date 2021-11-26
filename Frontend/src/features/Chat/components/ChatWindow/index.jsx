import { appendMessageToChat, readChat, removeSelectedId } from "app/chatSlice";
import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import Pagination from "components/Pagination";
import useChatApi from "hooks/api/useChatApi";
import useMessagePagination from "hooks/pagination/useMessagePagination";
import React, { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link, useHistory } from "react-router-dom";
import { DefaultName } from "utils/Constants";
import { ChatType } from "utils/Enums";
import { formatDate } from "utils/UtilityMethods";
import ChatInput from "../ChatInput";
import EditChat from "../EditChat";

function ChatWindow({ chat }) {
  const dispatch = useDispatch();
  const history = useHistory();
  const currentUser = useSelector((state) => state.users.currentUser);
  const chatApi = useChatApi();

  const [showTimeIndexes, setShowTimeIndexes] = useState([]);
  const [isOpenInfoPopup, setIsOpenInfoPopup] = useState(false);
  const [friend, setFriend] = useState({});
  const [seenBy, setSeenBy] = useState("");

  function handleMessageClick(index) {
    var result = [...showTimeIndexes];
    const i = result.findIndex((x) => x === index);
    if (i >= 0) {
      result = result.filter((x) => x !== index);
    } else {
      result.push(index);
    }
    setShowTimeIndexes(result);
  }

  // infinity scrolling
  const [page, setPage] = useState(1);
  const { appendChat, isHasMore, isLoading, error } = useMessagePagination(
    chat,
    page,
  );
  const endMessageRef = useRef();

  useEffect(() => {
    if (chat?.numOfUnreadMessages > 0) {
      chatApi.readChat(chat?.id).then((res) => {
        dispatch(readChat(chat?.id));
      });
    }
    if (chat?.participants.length > 0) {
      let newFriend = chat?.participants
        ?.filter((x) => x.userName !== currentUser?.userName)
        .shift();
      setFriend(newFriend ?? currentUser);

      if (chat?.readByUserNames?.length > 1) {
        let newSeenBy = "";
        let firstNameList = chat?.readByUserNames
          ?.filter((userName) => userName !== currentUser?.userName)
          ?.map((userName) => {
            let firstName = chat.participants
              .filter((x) => x.userName === userName)
              ?.shift()?.firstName;
            return firstName;
          });

        if (firstNameList?.length > 1) {
          newSeenBy = "Seen by " + firstNameList.filter((x) => x).join(", ");
          setSeenBy(newSeenBy);
        } else {
          setSeenBy("");
        }
      }
    }
  }, [chat]);

  useEffect(() => {
    dispatch(appendMessageToChat(appendChat));
  }, [appendChat]);

  const scrollToBottom = () => {
    if (endMessageRef) {
      endMessageRef?.current?.scrollIntoView();
    }
  };

  useEffect(() => {
    if (chat?.page < 2) {
      scrollToBottom();
    }
  }, [chat]);

  function loadMore() {
    if (page < chat?.pageCount) {
      setPage((prevPage) => prevPage + 1);
    }
  }
  return (
    <>
      <EditChat
        isOpen={isOpenInfoPopup}
        setIsOpen={setIsOpenInfoPopup}
        chat={chat}
      />
      <div className="flex flex-col w-full h-full pb-2 flex-shrink-0 min-w-0 bg-white dark:bg-dark-secondary rounded-lg text-black dark:text-white shadow max-w-350">
        {/* Header chat window */}
        <div className="w-full border-b border-gray-300 dark:border-dark-third flex justify-between items-center py-1 pl-2 flex-shrink-0 overflow-hidden ">
          <div
            onClick={() => {
              if (chat.type === ChatType.GROUP) {
                setIsOpenInfoPopup(!isOpenInfoPopup);
              } else {
                history.push("/profile/" + friend?.userName);
              }
            }}
            className="flex min-w-0 justify-start clickable cursor-pointer items-center space-x-3 p-2 transition-base rounded-lg"
          >
            <ImageCircle
              src={
                chat?.groupAvatarUrl !== ""
                  ? chat?.groupAvatarUrl
                  : friend?.avatarUrl
              }
              size="xs"
              participants={chat?.participants}
            />
            <span className="font-semibold truncate overflow-hidden">
              {chat?.type === ChatType.PRIVATE
                ? friend?.fullName
                : chat?.name ?? DefaultName.NO_NAME_GROUP}
            </span>
          </div>
          <div className="flex items-center mr-2">
            <ClickableIcon
              iconClass="bx bx-x-circle"
              secondMode
              colorIconClass="text-green-500 dark:text-green-500"
              onClick={() => dispatch(removeSelectedId(chat.id))}
            />
          </div>
        </div>
        {/* End header chat window */}

        {/* Chat content */}
        {chat?.messages ? (
          <div className="flex-grow overflow-y-auto overflow-x-hidden px-4 pb-4 pt-1 space-y-1 flex flex-col min-w-0">
            <Pagination
              loadMoreClassName="bg-gray-200 hover:bg-gray-300"
              onClick={loadMore}
              isLoading={isLoading}
              error={error}
              isHasMore={isHasMore}
              loadMoreContent="Load more messages..."
            />
            {!isHasMore && (
              <div className="text-gray-500 text-xs text-center pb-2">
                {formatDate(chat?.dateCreated)}
              </div>
            )}
            {[...chat?.messages]
              ?.sort((messageA, messageB) => {
                return messageA?.dateCreated > messageB?.dateCreated ? 1 : -1;
              })
              .map((message, index) =>
                message.senderUserName === currentUser.userName ? (
                  <div
                    className="flex-shrink-0"
                    key={message.id ?? "message" + index}
                  >
                    <div className="flex flex-col items-end w-full flex-shrink-0">
                      {showTimeIndexes.includes(index) && (
                        <span className="transition-all animate-fadeIn text-xs text-gray-400 left-0 bottom-full mb-1 ml-1 space-x-2 w-60 truncate overflow-ellipsis text-right">
                          {formatDate(message?.dateCreated) ?? ""}
                        </span>
                      )}
                      {message.imageUrl ? (
                        <img
                          onClick={() => handleMessageClick(index)}
                          className="max-w-200 rounded-lg shadow transition-all duration-200 cursor-pointer"
                          src={message.imageUrl}
                          alt="Message"
                        />
                      ) : (
                        <span
                          onClick={() => handleMessageClick(index)}
                          className={
                            "text-white rounded-3xl px-3 py-2 break-word rounded-br-none cursor-pointer overflow-x-auto max-w-3/4 text-sm" +
                            " " +
                            (showTimeIndexes.includes(index)
                              ? "bg-green-600 dark:bg-green-800"
                              : "bg-gradient-to-br from-green-400 to-green-600 dark:from-green-500 dark:to-green-800 shadow-md")
                          }
                        >
                          {message.content}
                        </span>
                      )}
                    </div>
                    {chat?.type === ChatType.PRIVATE &&
                      chat?.messages?.length === index + 1 && (
                        <>
                          <div className="text-xs font-semibold text-right text-gray-600 dark:text-dark-txt mr-2 select-none">
                            {chat?.readByUserNames?.includes(friend?.userName)
                              ? "Seen"
                              : ""}
                          </div>
                        </>
                      )}
                  </div>
                ) : (
                  <div
                    key={message.id ?? "message" + index}
                    className="flex flex-shrink-0 items-end space-x-2"
                  >
                    <Link
                      to={
                        "/profile/" +
                        chat?.participants
                          .filter((x) => x.userName === message.senderUserName)
                          .shift()?.userName
                      }
                    >
                      <ImageCircle
                        src={
                          chat?.participants
                            .filter(
                              (x) => x.userName === message.senderUserName,
                            )
                            .shift()?.avatarUrl
                        }
                        size="sm"
                        userName={message.senderUserName}
                      />
                    </Link>
                    <div className="flex flex-col w-full items-start">
                      {showTimeIndexes.includes(index) && (
                        <span className="transition-all animate-fadeIn text-xs text-gray-400 bottom-full mb-1 ml-1 space-x-2 w-60 truncate overflow-ellipsis text-left">
                          {(chat?.type === ChatType.GROUP
                            ? message.senderFullName + " - "
                            : "") + formatDate(message.dateCreated) ?? ""}
                        </span>
                      )}
                      {message.imageUrl ? (
                        <img
                          onClick={() => handleMessageClick(index)}
                          className="max-w-200 rounded-lg shadow cursor-pointer"
                          src={message.imageUrl}
                          alt="Message"
                        />
                      ) : (
                        <span
                          className={
                            " rounded-3xl px-3 py-2 break-word rounded-bl-none shadow-sm cursor-pointer overflow-x-auto max-w-3/4 text-sm " +
                            " " +
                            (showTimeIndexes.includes(index)
                              ? "bg-gray-300 dark:bg-dark-third"
                              : "bg-gradient-to-br from-gray-100 to-gray-300 dark:from-gray-500 dark:to-gray-600 ")
                          }
                          onClick={() => handleMessageClick(index)}
                        >
                          {message.content}
                        </span>
                      )}
                    </div>
                  </div>
                ),
              )}
            {chat?.type === ChatType.GROUP && (
              <>
                <div className="text-xs font-semibold text-right text-gray-600 dark:text-dark-txt mr-2 select-none">
                  {seenBy}
                </div>
              </>
            )}
            <div ref={endMessageRef}></div>
          </div>
        ) : (
          <div className="flex-grow flex-center  mx-4 my-2 text-center text-sm">
            No message
          </div>
        )}
        {/* End chat content */}

        <div className="px-2">
          <ChatInput chatId={chat?.id} />
        </div>
      </div>
    </>
  );
}

export default ChatWindow;
