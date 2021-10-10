import { appendMessageToChat } from "app/chatSlice";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import useChatApi from "../api/useChatApi";

export default function useMessagePagination(currentChat = {}, page) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState("");
  const [isHasMore, setIsHasMore] = useState(false);

  const chatApi = useChatApi();
  const dispatch = useDispatch();

  useEffect(() => {
    if (page > 1 && isHasMore) {
      setIsLoading(true);
      setError(false);

      const request = { page };
      chatApi
        .getById(currentChat.id, request)
        .then((response) => {
          dispatch(appendMessageToChat(response));
          setIsHasMore(page < response.pageCount);
          setIsLoading(false);
        })
        .catch((e) => {
          setError(e);
        });
    }
  }, [page]);

  useEffect(() => {
    setIsHasMore(page < currentChat.pageCount);
  }, [currentChat]);

  return { isLoading, error, isHasMore };
}
