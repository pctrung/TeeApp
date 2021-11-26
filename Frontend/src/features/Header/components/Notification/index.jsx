import ImageCircle from "components/ImageCircle";
import React from "react";
import { NotificationType, ReactionIcon, ReactionName } from "utils/Enums";
import { formatDate } from "utils/UtilityMethods";

function Notification({ notification, onClick }) {
  return (
    <>
      <div
        className="relative select-none w-full flex flex-start items-center cursor-pointer hover:bg-gray-100 p-2  rounded-lg transition-base dark:hover:bg-dark-third dark:text-dark-txt"
        onClick={() => onClick(notification)}
      >
        {!notification?.isRead && (
          <span className="w-3 h-3 absolute right-2 top-1/2 transform -translate-y-1/2 text-xs font-bold p-1 bg-green-500 dark:bg-green-600 text-white rounded-full text-center align-middle"></span>
        )}
        <div className="relative flex-shrink-0">
          <ImageCircle src={notification?.creator?.avatarUrl} />
          {notification?.type === NotificationType.REACTION && (
            <div className="h-5 w-5 absolute -right-1 top-full transform -translate-y-4">
              <img
                src={ReactionIcon[notification.reactionType]}
                alt={ReactionName[notification.reactionType]}
                className="w-full h-full"
              />
            </div>
          )}
        </div>
        <div className="font-primary flex flex-col pl-3 justify-between w-full max-w-lg">
          <div className="flex flex-col justify-between items-start w-full min-w-0">
            <span
              className={
                "text-sm md:text-base text-gray-800 dark:text-dark-txt max-w-full overflow-ellipsis break-word max-row-2" +
                " " +
                (!notification?.isRead ? "font-bold pr-3" : "")
              }
            >
              {notification?.content}
            </span>
            <span
              className={
                "text-xs md:text-sm text-gray-500 truncate flex-shrink-0" +
                " " +
                (!notification?.isRead ? "font-bold" : "")
              }
            >
              {formatDate(notification?.dateCreated)}
            </span>
          </div>
        </div>
      </div>
    </>
  );
}

export default Notification;
