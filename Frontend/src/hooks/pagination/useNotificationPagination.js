import { useEffect, useState } from "react";
import useNotificationApi from "hooks/api/useNotificationApi";
import { loadNotification, refreshNotification } from "app/appSlice";
import { useDispatch, useSelector } from "react-redux";

export default function useNotificationPagination(page = 1) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const notifications = useSelector((state) => state.app.notifications);
  const [isHasMore, setIsHasMore] = useState(true);

  const notificationApi = useNotificationApi();
  const dispatch = useDispatch();

  useEffect(() => {
    if (isHasMore) {
      setIsLoading(true);
      setError(false);
      const request = { page };
      notificationApi
        .getAll(request)
        .then((response) => {
          if (page > 1) {
            dispatch(loadNotification(response));
          } else {
            dispatch(refreshNotification(response));
          }
          setIsHasMore(page < response.pageCount);
          setIsLoading(false);
        })
        .catch((e) => {
          setError(e);
        });
    }
  }, [page]);

  return { notifications, isLoading, error, isHasMore };
}
