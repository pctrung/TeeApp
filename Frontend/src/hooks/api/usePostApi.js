import { setIsLoading } from "app/appSlice.js";
import { useDispatch } from "react-redux";
import { DefaultLimit } from "utils/Constants.js";
import useApi from "./useApi.js";

const baseApiUrl = "/posts";

export default function usePostApi() {
  const Api = useApi();
  const dispatch = useDispatch();

  const postApi = {
    getAll: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.POST };
      }
      const url = `${baseApiUrl}`;
      return Api.get(url, { params });
    },
    getAllAdmin: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.POST };
      }
      const url = `${baseApiUrl}/admin`;
      return Api.get(url, { params });
    },
    hide: (id, note) => {
      const url = `${baseApiUrl}/${id}/hide`;
      return Api.post(url, { note });
    },
    show: (id) => {
      const url = `${baseApiUrl}/${id}/show`;
      return Api.post(url);
    },
    getNewsFeed: (params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.POST };
      }
      const url = `${baseApiUrl}/newsFeed`;
      return Api.get(url, { params });
    },
    getByUserName: (userName, params) => {
      if (!params?.limit) {
        params = { ...params, limit: DefaultLimit.POST };
      }
      const url = `users/${userName}/posts`;
      return Api.get(url, { params });
    },
    getById: (id) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/${id}`;
      return Api.get(url);
    },
    addPost: (request) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}`;
      return Api.post(url, request);
    },
    updatePost: (postId, request) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/${postId}`;
      return Api.put(url, request);
    },
    deletePost: (postId) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/${postId}`;
      return Api.delete(url);
    },
    addPhoto: (postId, request) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/${postId}/photos`;
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
      return Api.post(url, request);
    },
    deletePhoto: (postId, photoId) => {
      dispatch(setIsLoading(true));
      const url = `${baseApiUrl}/${postId}/photos/${photoId}`;
      return Api.delete(url);
    },
    addReaction: (postId, request) => {
      const url = `${baseApiUrl}/${postId}/reactions`;
      return Api.post(url, request);
    },
    updateReaction: (postId, request) => {
      const url = `${baseApiUrl}/${postId}/reactions`;
      return Api.put(url, request);
    },
    deleteReaction: (postId) => {
      const url = `${baseApiUrl}/${postId}/reactions`;
      return Api.delete(url);
    },
    addComment: (postId, request) => {
      const url = `${baseApiUrl}/${postId}/comments`;
      return Api.post(url, request);
    },
    updateComment: (postId, commentId, request) => {
      const url = `${baseApiUrl}/${postId}/comments/${commentId}`;
      return Api.put(url, request);
    },
    deleteComment: (postId, commentId) => {
      const url = `${baseApiUrl}/${postId}/comments/${commentId}`;
      return Api.delete(url);
    },
  };
  return postApi;
}
