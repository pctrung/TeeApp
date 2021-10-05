import { setIsLoading } from "app/appSlice.js";
import { useDispatch } from "react-redux";
import useApi from "./useApi.js";

const baseApiUrl = "/users";

export default function useUserApi() {
  const Api = useApi();
  const dispatch = useDispatch();

  const userApi = {
    getUserList: () => {
      const url = `${baseApiUrl}`;
      return Api.get(url);
    },
    getCurrentUser: () => {
      const url = `${baseApiUrl}/current`;
      return Api.get(url);
    },
    getByUserName: (userName) => {
      const url = `${baseApiUrl}/${userName}`;
      return Api.get(url);
    },
    updateInformation: (content) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}`;
      return Api.put(url, content);
    },
    updateAvatar: (content) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/avatar`;
      Api.interceptors.request.use(async (config) => {
        var token = window.localStorage.getItem("token");
        var newConfig = {};
        if (token) {
          newConfig = {
            ...config,
            headers: {
              "content-type": "multipart/form-data",
              Authorization: `Bearer ${token}`,
            },
          };
        }
        return newConfig;
      });
      return Api.patch(url, content);
    },
    updateCover: (content) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/cover`;
      Api.interceptors.request.use(async (config) => {
        var token = window.localStorage.getItem("token");
        var newConfig = {};
        if (token) {
          newConfig = {
            ...config,
            headers: {
              "content-type": "multipart/form-data",
              Authorization: `Bearer ${token}`,
            },
          };
        }
        return newConfig;
      });
      return Api.patch(url, content);
    },
  };
  return userApi;
}
