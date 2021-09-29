const DefaultLimit = {
  NOTIFICATION: 50,
};

const DefaultName = {
  NO_NAME_GROUP: "No name",
  NO_NAME_USER: "Unknown",
};

const ChatClient = {
  RECEIVE_MESSAGE: "ReceiveMessage",
  RECEIVE_CHAT: "ReceiveChat",
  RECEIVE_UPDATED_CHAT: "ReceiveUpdatedChat",
  RECEIVE_UPDATED_GROUP_AVATAR: "ReceiveUpdatedGroupAvatar",
  RECEIVE_ADD_READ_BY_USERNAME: "ReceiveAddReadByUserName",
  RECEIVE_UPDATED_ONLINE_USERNAME_LIST: "ReceiveUpdatedOnlineUserNameList",
};

const AppClient = {
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
export { DefaultName, ChatClient, AppClient, DefaultLimit };
