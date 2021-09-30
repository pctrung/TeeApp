import React from "react";
import PropTypes from "prop-types";
import ImageCircle from "components/ImageCircle";
import moment from "moment";

Notification.propTypes = {};

function Notification({ notification, onClick }) {
  return (
    <>
      <div
        className="relative select-none w-full flex flex-start items-center cursor-pointer hover:bg-gray-100 p-2  rounded-lg transition-base dark:hover:bg-dark-third dark:text-dark-txt"
        onClick={() => onClick(notification)}
      >
        {!notification?.isRead && (
          <span className="w-3 h-3 absolute right-0 top-1/2 transform -translate-y-1/2 text-xs font-bold p-1 bg-green-500 dark:bg-green-600 text-white rounded-full text-center align-middle"></span>
        )}
        <ImageCircle src={notification?.creator?.avatarUrl} />
        <div className="font-primary flex flex-col pl-3 justify-between w-full max-w-500">
          <div className="flex flex-col justify-between items-start w-full min-w-0">
            <span
              className={
                "text-gray-800 dark:text-dark-txt max-w-full overflow-ellipsis break-word max-row-2" +
                " " +
                (!notification?.isRead ? "font-bold" : "")
              }
            >
              {notification?.content}
            </span>
            <span
              className={
                "text-sm text-gray-500 truncate flex-shrink-0" +
                " " +
                (!notification?.isRead ? "font-bold" : "")
              }
            >
              {moment(
                new Date(notification?.dateCreated),
                "YYYYMMDD",
              ).fromNow()}
            </span>
          </div>
        </div>
      </div>
    </>
  );
}

export default Notification;
