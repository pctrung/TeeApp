import useApi from "./useApi.js";

const baseApiUrl = "/BlockedKeywordGroups";

export default function useBlockedKeywordApi() {
  const Api = useApi();

  const blockedKeywordApi = {
    getAll: () => {
      const url = `${baseApiUrl}`;
      return Api.get(url);
    },
    update: (body) => {
      const url = `${baseApiUrl}`;
      return Api.put(url, body);
    },
    delete: (id) => {
      const url = `${baseApiUrl}/${id}`;
      return Api.delete(url);
    }
  };
  return blockedKeywordApi;
}
