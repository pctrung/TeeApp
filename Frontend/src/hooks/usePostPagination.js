import { useEffect, useState } from "react";
import usePostApi from "hooks/usePostApi";
import { useDispatch, useSelector } from "react-redux";
import { loadPost } from "app/postSlice";

export default function usePostPagination(posts, page = 1) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const [isHasMore, setIsHasMore] = useState(true);

  const postApi = usePostApi();
  const dispatch = useDispatch();

  useEffect(() => {
    if (page > 1 && isHasMore) {
      setIsLoading(true);
      setError(false);

      postApi
        .getAll({ page })
        .then((response) => {
          dispatch(loadPost(response));
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
