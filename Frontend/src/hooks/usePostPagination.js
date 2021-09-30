import { useEffect, useState } from "react";
import usePostApi from "hooks/usePostApi";
import { useDispatch, useSelector } from "react-redux";
import { loadPost, refreshPost } from "app/postSlice";

export default function usePostPagination(page = 1) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const posts = useSelector((state) => state.posts.posts);
  const [isHasMore, setIsHasMore] = useState(true);

  const postApi = usePostApi();
  const dispatch = useDispatch();

  useEffect(() => {
    if (isHasMore) {
      setIsLoading(true);
      setError(false);
      postApi
        .getAll({ page })
        .then((response) => {
          if (page > 1) {
            dispatch(loadPost(response));
          } else {
            dispatch(refreshPost(response));
          }
          setIsHasMore(page < response.pageCount);
          setIsLoading(false);
        })
        .catch((e) => {
          setError(e);
        });
    }
  }, [page]);

  return { posts, isLoading, error, isHasMore };
}
