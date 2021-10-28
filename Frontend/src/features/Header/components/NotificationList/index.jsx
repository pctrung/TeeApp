import { readAllNotification, readNotificationById } from "app/appSlice";
import Pagination from "components/Pagination";
import useNotificationApi from "hooks/api/useNotificationApi";
import useNotificationPagination from "hooks/pagination/useNotificationPagination";
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { useHistory } from "react-router-dom";
import { NotificationType } from "utils/Enums";
import Notification from "../Notification";

function NotificationList({ className, setIsOpen, setNotificationNumber }) {
  const [page, setPage] = useState(1);
  const dispatch = useDispatch();
  const history = useHistory();
  const { notifications, isHasMore, isLoading, error } =
    useNotificationPagination(page);
  const notificationApi = useNotificationApi();

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

  useEffect(() => {
    if (notifications.items) {
      var num = notifications.items.reduce((preNum, x) => {
        return preNum + (x?.isRead ? 0 : 1);
      }, 0);
      setNotificationNumber(num);
    }
  }, [notifications]);

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
        <div className="flex justify-between items-baseline border-b dark:border-dark-hover pb-1 mb-2">
          <span className="text-2xl font-bold">Notifications</span>
          <span
            className="text-green-600 hover:text-green-700 active:text-green-800 dark:text-green-400 dark:hover:text-green-300 dark:active:text-green-200 cursor-pointer select-none transition-base text-sm"
            onClick={readAll}
          >
            Mark all as read
          </span>
        </div>
        <div className="overflow-y-auto md:max-h-500 max-h-400">
          {notifications &&
            [...notifications?.items]
              .filter((x) => !x.isRead)
              .sort((a, b) => (a?.dateCreated < b?.dateCreated ? 1 : -1))
              ?.map((notification, index) => (
                <Notification
                  onClick={handleClick}
                  key={notification.id}
                  notification={notification}
                />
              ))}
          {notifications &&
            [...notifications?.items]
              .filter((x) => x.isRead)
              .sort((a, b) => (a?.dateCreated < b?.dateCreated ? 1 : -1))
              ?.map((notification, index) => (
                <Notification
                  onClick={handleClick}
                  key={notification.id}
                  notification={notification}
                />
              ))}
          <Pagination
            className="mt-2"
            onClick={loadMore}
            isLoading={isLoading}
            error={error}
            isHasMore={isHasMore}
            loadMoreContent="Load more notifications..."
          />
        </div>
        {notifications?.items?.length < 1 && (
          <span className="my-2 pb-2 text-center w-full font-semibold">
            Do not have any notifications
          </span>
        )}
      </div>
    </>
  );
}

export default NotificationList;
