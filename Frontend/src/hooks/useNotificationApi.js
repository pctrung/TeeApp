import { DefaultLimit } from "utils/Constants.js";
import useApi from "./useApi.js";

const baseApiUrl = "/notifications";

export default function useNotificationApi() {
  const Api = useApi();

  const notificationApi = {
    getAll: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.NOTIFICATION };
      }
      const url = `${baseApiUrl}`;
      return Api.get(url, { params });
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
