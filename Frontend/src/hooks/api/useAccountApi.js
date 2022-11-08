import { setIsLoading } from "app/appSlice.js";
import { useDispatch } from "react-redux";
import useApi from "./useApi.js";

const baseApiUrl = "/accounts";

export default function useAccountApi() {
  const Api = useApi();
  const dispatch = useDispatch();

  const accountApi = {
    login: (content) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/login`;
      return Api.post(url, content);
    },
    changePassword: (content) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/changePassword`;
      return Api.post(url, content);
    },
    logout: () => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/logout`;
      return Api.post(url);
    },
    register: (content) => {
      content.firstName = content?.firstName?.substring(0, 49);
      content.lastName = content?.lastName?.substring(0, 49);

      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/register`;
      return Api.post(url, content);
    },
    checkUserNameExists: (userName) => {
      if (userName) {
        const url = `${baseApiUrl}/${userName}/isExists`;
        return Api.get(url);
      }
      return Promise.reject();
    },
    lock: (userName) => {
      if (userName) {
        const url = `${baseApiUrl}/lockout/${userName}`;
        return Api.post(url);
      }
      return Promise.reject();
    },
    unlock: (userName) => {
      if (userName) {
        const url = `${baseApiUrl}/unlock/${userName}`;
        return Api.post(url);
      }
      return Promise.reject();
    },
  };
  return accountApi;
}
