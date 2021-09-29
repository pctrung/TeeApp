import { readAllNotification, readNotificationById } from "app/appSlice";
import ImageCircle from "components/ImageCircle";
import LoadingSpinner from "components/LoadingSpinner";
import useNotificationApi from "hooks/useNotificationApi";
import useNotificationPagination from "hooks/useNotificationPagination";
import moment from "moment";
import React, { useRef, useState } from "react";
import { useDispatch } from "react-redux";
import { useHistory } from "react-router-dom";
import { NotificationType } from "utils/Enums";

function NotificationList({ notifications, className, setIsOpen }) {
  const notificationApi = useNotificationApi();
  const dispatch = useDispatch();
  const history = useHistory();

  function handleClick(notification = {}) {
    if (!notification.isRead) {
      dispatch(readNotificationById(notification.id));
      notificationApi.readById(notification.id);
    }
    switch (notification.type) {
      case NotificationType.COMMENT:
      case NotificationType.REACTION:
        if (notification?.postId) {
          history.push("/posts/" + notification?.postId);
        }
        break;
      case NotificationType.FRIEND_REQUEST:
      case NotificationType.ACCEPTED_FRIEND_REQUEST:
      case NotificationType.FOLLOW:
        history.push("/friends");
        break;
      default:
    }
    setIsOpen(false);
  }

  const [page, setPage] = useState(1);
  const { isHasMore, isLoading, error } = useNotificationPagination(
    notifications,
    page,
  );

  function loadMore() {
    if (isHasMore) {
      setPage((prevPage) => prevPage + 1);
    }
  }
  function readAll() {
    dispatch(readAllNotification());
    notificationApi.readAll();
  }
  return (
    <>
      <div
        className={
          className +
          " " +
          "flex flex-col bg-white dark:bg-dark-secondary shadow-lg rounded-xl px-5 py-4 pb-3 border dark:border-dark-hover "
        }
      >
        <div className="flex justify-between items-center">
          <span className="text-lg md:text-2xl font-bold mb-2">
            Notifications
          </span>
          <span
            className="text-green-600 hover:text-green-700 active:text-green-800 dark:text-green-400 dark:hover:text-green-300 dark:active:text-green-200 cursor-pointer select-none transition-base text-sm"
            onClick={readAll}
          >
            Mark all as read
          </span>
        </div>
        <div className="overflow-y-auto max-h-full">
          {notifications &&
            [...notifications?.items]
              .sort((a, b) => (a?.dateCreated < b?.dateCreated ? 1 : -1))
              ?.map((notification, index) => (
                <>
                  <div
                    key={Date.now() + index}
                    className="relative select-none w-full flex flex-start items-center cursor-pointer hover:bg-gray-100 p-2  rounded-lg transition-base dark:hover:bg-dark-third dark:text-dark-txt"
                    onClick={() => handleClick(notification)}
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
              ))}
          {isHasMore && !isLoading && (
            <div className="flex">
              <button
                className="mx-auto mt-3 px-4 bg-gray-100 py-2 rounded-lg transform active:scale-95 hover:bg-gray-200 dark:hover:bg-dark-hover dark:bg-dark-third dark:text-gray-300 text-xs md:text-sm transition-all duration-200"
                onClick={loadMore}
              >
                Load more notifications...
              </button>
            </div>
          )}
          {isLoading && (
            <div className="flex justify-center mt-2">
              <LoadingSpinner />
            </div>
          )}
          {error && <div className="text-red-500 text-center ">{error}</div>}
        </div>
        {notifications?.items?.length < 1 && (
          <span className="mt-2">Do not have any notifications</span>
        )}
      </div>
    </>
  );
}

export default NotificationList;
