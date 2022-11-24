import useApi from "./useApi.js";

const baseApiUrl = "/PostReports";

export default function usePostReportApi() {
  const Api = useApi();

  const postReportApi = {
    getAll: () => {
      const url = `${baseApiUrl}`;
      return Api.get(url);
    },
    update: (body) => {
      const url = `${baseApiUrl}`;
      return Api.put(url, body);
    },
    add: (body) => {
      const url = `${baseApiUrl}`;
      return Api.post(url, body);
    }
  };
  return postReportApi;
}
