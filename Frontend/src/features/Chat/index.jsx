import { HubConnectionBuilder } from "@microsoft/signalr";
import {
  addChat,
  addMessage,
  addNotification,
  addReadByUserName,
  addSelectedId,
  editChat,
  editGroupAvatar,
  refreshChats,
} from "app/chatSlice";
import { updateOnlineUserNameList } from "app/userSlice";
import useChatApi from "hooks/useChatApi";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { ChatClient } from "utils/Constant";

function Chat() {
  const dispatch = useDispatch();

  const [connection, setConnection] = useState(null);

  const currentUser = useSelector((state) => state.users.currentUser);
  const selectedId = useSelector((state) => state.chats.selectedId);

  const chatApi = useChatApi();

  useEffect(() => {
    async function fetchData() {
      chatApi
        .getAll()
        .then((response) => {
          dispatch(refreshChats(response.data));
        })
        .catch((error) => {
          console.error("Connection failed: ", error);
        });
    }

    fetchData();
  }, []);

  // for realtime
  useEffect(() => {
    const newConnection = new HubConnectionBuilder()
      .withUrl(process.env.REACT_APP_CHAT_HUB_URL, {
        accessTokenFactory: () => localStorage.getItem("token"),
      })
      .withAutomaticReconnect()
      .build();

    setConnection(newConnection);
  }, []);

  useEffect(() => {
    if (connection && !connection.connectionStarted) {
      connection.start().then((result) => {
        connection.on(ChatClient.RECEIVE_MESSAGE, (response) => {
          const action = addMessage(response);
          dispatch(action);
          if (response.chatId && selectedId !== response.chatId) {
            dispatch(addNotification(response.chatId));
          }
        });
        connection.on(ChatClient.RECEIVE_CHAT, (chat) => {
          const action = addChat(chat);
          dispatch(action);
          if (chat.creatorUserName === currentUser.userName) {
            dispatch(addSelectedId(chat.id));
          }
        });
        connection.on(ChatClient.RECEIVE_UPDATED_CHAT, (chat) => {
          const action = editChat(chat);
          dispatch(action);
        });
        connection.on(ChatClient.RECEIVE_UPDATED_GROUP_AVATAR, (response) => {
          const action = editGroupAvatar(response);
          dispatch(action);
        });
        connection.on(ChatClient.RECEIVE_ADD_READ_BY_USERNAME, (response) => {
          const action = addReadByUserName(response);
          dispatch(action);
        });
        connection.on(
          ChatClient.RECEIVE_UPDATED_ONLINE_USERNAME_LIST,
          (response) => {
            const action = updateOnlineUserNameList(response);
            dispatch(action);
          },
        );
      });
    }
    return () => {
      if (connection && connection.connectionStarted) {
        connection.stop();
      }
    };
  }, [connection]);

  return <div></div>;
}

export default Chat;
