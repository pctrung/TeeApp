import { useEffect, useState } from "react";
import useNotificationApi from "hooks/useNotificationApi";
import { loadNotification } from "app/appSlice";
import { useDispatch } from "react-redux";

export default function useNotificationPagination(
  notifications = {},
  page = 1,
) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const [isHasMore, setIsHasMore] = useState(notifications.pageCount > page);

  const notificationApi = useNotificationApi();
  const dispatch = useDispatch();

  useEffect(() => {
    if (page > 1 && isHasMore) {
      setIsLoading(true);
      setError(false);

      const request = { page };
      notificationApi
        .getAll(request)
        .then((response) => {
          dispatch(loadNotification(response));
          setIsHasMore(page < response.pageCount);
          setIsLoading(false);
        })
        .catch((e) => {
          setError(e);
        });
    }
  }, [page]);

  return { isLoading, error, isHasMore };
}
