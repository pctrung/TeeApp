import { DefaultLimit } from "utils/Constants.js";
import useApi from "./useApi.js";

const baseApiUrl = "/friends";

export default function useFriendApi() {
  const Api = useApi();

  const friendApi = {
    getFriends: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.FRIEND };
      }
      const url = `${baseApiUrl}`;
      return Api.get(url, { params });
    },
    getFriendRequests: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.FRIEND };
      }
      const url = `${baseApiUrl}/friendRequests`;
      return Api.get(url, { params });
    },
    getMyRequests: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.FRIEND };
      }
      const url = `${baseApiUrl}/myRequests`;
      return Api.get(url, { params });
    },
    getFollowers: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.FRIEND };
      }
      const url = `${baseApiUrl}/followers`;
      return Api.get(url, { params });
    },
    getFollowing: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.FRIEND };
      }
      const url = `${baseApiUrl}/following`;
      return Api.get(url, { params });
    },
    getBlocked: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.FRIEND };
      }
      const url = `${baseApiUrl}/blocked`;
      return Api.get(url, { params });
    },
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
