import { setIsLoading } from "app/appSlice.js";
import { useDispatch } from "react-redux";
import useApi from "./useApi.js";

const baseApiUrl = "/friends";

export default function useFriendApi() {
  const Api = useApi();
  const dispatch = useDispatch();

  const friendApi = {
    getRelationByUserName: (userName) => {
      const url = `${baseApiUrl}/${userName}`;
      return Api.get(url);
    },
    addFriend: (userName) => {
      const url = `${baseApiUrl}/${userName}/addFriend`;
      return Api.patch(url);
    },
    unfriend: (userName) => {
      const url = `${baseApiUrl}/${userName}/unfriend`;
      return Api.patch(url);
    },
    accept: (userName) => {
      const url = `${baseApiUrl}/${userName}/accept`;
      return Api.patch(url);
    },
    block: (userName) => {
      const url = `${baseApiUrl}/${userName}/block`;
      return Api.patch(url);
    },
    unblock: (userName) => {
      const url = `${baseApiUrl}/${userName}/unblock`;
      return Api.patch(url);
    },
    follow: (userName) => {
      const url = `${baseApiUrl}/${userName}/follow`;
      return Api.patch(url);
    },
    unfollow: (userName) => {
      const url = `${baseApiUrl}/${userName}/unfollow`;
      return Api.patch(url);
    },
  };
  return friendApi;
}
