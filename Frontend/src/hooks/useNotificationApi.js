import { setIsLoading } from "app/appSlice.js";
import { useDispatch } from "react-redux";
import useApi from "./useApi.js";

const baseApiUrl = "/notifications";

export default function useNotificationApi() {
  const Api = useApi();
  const dispatch = useDispatch();

  const notificationApi = {
    getAll: () => {
      const url = `${baseApiUrl}`;
      return Api.get(url);
    },
    readAll: () => {
      const url = `${baseApiUrl}/read`;
      return Api.patch(url);
    },
    readById: (id) => {
      const url = `${baseApiUrl}/${id}/read`;
      return Api.patch(url);
    },
  };
  return notificationApi;
}
