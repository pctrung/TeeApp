import { useEffect, useState } from "react";
import usePostApi from "hooks/api/usePostApi";
import { useDispatch, useSelector } from "react-redux";
import { loadPost, refreshPost } from "app/postSlice";

export default function useAllPostPagination(pagination) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const posts = useSelector((state) => state.posts.posts);
  const [isHasMore, setIsHasMore] = useState(true);

  const postApi = usePostApi();
  const dispatch = useDispatch();

  useEffect(() => {
    // auto fetch data when page = 1
    if (pagination.page === -1) {
      dispatch(refreshPost({ items: [] }));
    }
    if (
      ((isHasMore && pagination) || pagination.page === 1) &&
      pagination.page !== -1
    ) {
      setIsLoading(true);
      setError(false);
      postApi
        .getAll(pagination)
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
  }, [pagination?.page, pagination?.limit, pagination?.keyword]);

  return { posts, isLoading, error, isHasMore };
}
