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
