import { useEffect, useState } from "react";
import usePostApi from "hooks/api/usePostApi";
import { useDispatch, useSelector } from "react-redux";
import { loadPost, refreshPost } from "app/postSlice";

export default function usePostPagination(pagination, userName = "") {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const posts = useSelector((state) => state.posts.posts);
  const [isHasMore, setIsHasMore] = useState(true);

  const postApi = usePostApi();
  const dispatch = useDispatch();

  useEffect(() => {
    // auto fetch data when page = 1
    if ((isHasMore && pagination?.page) || pagination.page === 1) {
      setIsLoading(true);
      setError(false);
      if (userName) {
        postApi
          .getByUserName(userName, { page: pagination.page })
          .then((response) => {
            if (pagination.page > 1) {
              dispatch(loadPost(response));
            } else {
              dispatch(refreshPost(response));
            }
            setIsHasMore(pagination.page < response.pageCount);
            setIsLoading(false);
          })
          .catch((e) => {
            setError(e);
          });
      } else {
        postApi
          .getNewsFeed({ page: pagination.page })
          .then((response) => {
            if (pagination.page > 1) {
              dispatch(loadPost(response));
            } else {
              dispatch(refreshPost(response));
            }
            setIsHasMore(pagination.page < response.pageCount);
            setIsLoading(false);
          })
          .catch((e) => {
            setError(e);
          });
      }
    }
  }, [pagination]);

  return { posts, isLoading, error, isHasMore };
}
