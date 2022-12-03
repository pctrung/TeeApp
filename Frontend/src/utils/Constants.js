export const MAX_IMAGE_SIZE_NUMBER = 10;
export const MAX_IMAGE_SIZE = MAX_IMAGE_SIZE_NUMBER * 1024 * 1024;
export const ACCEPTED_FILE_TYPES = "image/png, image/jpg, image/tiff, image/tif, image/jpeg, video/mp4";
export const ACCEPTED_VIDEO_TYPES = "video/mp4";

export const DefaultLimit = {
  NOTIFICATION: 50,
  POST: 50,
  FRIEND: 50,
};

export const DefaultPagination = { page: 1, limit: 50, pageCount: 0, keyword: "" }

export const DefaultName = {
  NO_NAME_GROUP: "No name",
  NO_NAME_USER: "Unknown",
};

export const ChatClient = {
  RECEIVE_MESSAGE: "ReceiveMessage",
  RECEIVE_CHAT: "ReceiveChat",
  RECEIVE_UPDATED_CHAT: "ReceiveUpdatedChat",
  RECEIVE_UPDATED_GROUP_AVATAR: "ReceiveUpdatedGroupAvatar",
  RECEIVE_ADD_READ_BY_USERNAME: "ReceiveAddReadByUserName",
  RECEIVE_UPDATED_ONLINE_USERNAME_LIST: "ReceiveUpdatedOnlineUserNameList",
};

export const AppClient = {
  RECEIVE_POST: "ReceivePost",
  RECEIVE_UPDATED_POST: "ReceiveUpdatedPost",
  DELETE_POST: "DeletePost",
  RECEIVE_COMMENT: "ReceiveComment",
  RECEIVE_UPDATED_COMMENT: "ReceiveUpdatedComment",
  DELETE_COMMENT: "DeleteComment",
  RECEIVE_REACTION: "ReceiveReaction",
  RECEIVE_UPDATED_REACTION: "ReceiveUpdatedReaction",
  DELETE_REACTION: "DeleteReaction",
  RECEIVE_NOTIFICATION: "ReceiveNotification",
};
