import { DefaultLimit } from "utils/Constants.js";
import useApi from "./useApi.js";

const baseApiUrl = "/posts";

export default function usePostApi() {
  const Api = useApi();

  const postApi = {
    getAll: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.POST };
      }
      const url = `${baseApiUrl}`;
      return Api.get(url, { params });
    },
    getById: (id) => {
      const url = `${baseApiUrl}/${id}`;
      return Api.get(url);
    },
  };
  return postApi;
}
