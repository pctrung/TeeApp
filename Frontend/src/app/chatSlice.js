import { combineReducers, createSlice } from "@reduxjs/toolkit";

const chats = createSlice({
  name: "chats",
  initialState: [],
  reducers: {
    addChat: (state, action) => {
      var isExists = state.some((chat) => chat.id === action.payload.id);
      if (!isExists) {
        state.push(action.payload);
      }
    },
    editChat: (state, action) => {
      const updatedChat = action.payload;
      const index = state.findIndex((chat) => {
        return chat.id === updatedChat.id;
      });
      if (index >= 0) {
        state[index].name = updatedChat.name;
        state[index].participants = updatedChat.participants;
      } else {
        state.push(updatedChat);
      }
    },
    editGroupAvatar: (state, action) => {
      const updatedChatId = action.payload.chatId;
      const index = state.findIndex((chat) => {
        return chat.id === updatedChatId;
      });
      if (index >= 0) {
        state[index].groupAvatarUrl = action.payload?.groupAvatarUrl;
      }
    },
    addReadByUserName: (state, action) => {
      const { chatId, readByUserName } = action.payload;
      const index = state.findIndex((chat) => {
        return chat.id === chatId;
      });
      if (index >= 0) {
        if (!state[index].readByUserNames.includes(readByUserName)) {
          state[index].readByUserNames.push(readByUserName);
        }
      }
    },
    appendMessageToChat: (state, action) => {
      const chatToAppend = action.payload;
      const messagesToAppend = chatToAppend?.messages;
      if (chatToAppend && messagesToAppend) {
        const index = state.findIndex((chat) => {
          return chat.id === chatToAppend.id;
        });
        if (index >= 0) {
          state[index].totalRecords = chatToAppend.totalRecords;
          state[index].limit = chatToAppend.limit;
          state[index].page = chatToAppend.page;
          state[index].pageCount = chatToAppend.pageCount;
          if (chatToAppend.keyword) {
            state[index].messages = messagesToAppend;
          } else {
            state[index].messages =
              state[index].messages.concat(messagesToAppend);
          }
        }
      }
    },
    refreshChats: (state, action) => {
      state = action.payload ?? [];
      return state;
    },
    addMessage: (state, action) => {
      const newMessage = action.payload;
      const index = state.findIndex((chat) => {
        return chat.id === newMessage.chatId;
      });
      if (index >= 0) {
        state[index].messages.push(newMessage?.message);
        state[index].readByUserNames = [newMessage?.SenderUserName];
      }
    },
    addNotification: (state, action) => {
      const chatId = action.payload;
      const index = state.findIndex((chat) => {
        return chat.id === chatId;
      });
      if (index >= 0) {
        state[index].numOfUnreadMessages += 1;
      }
    },
    readChat: (state, action) => {
      const chatId = action.payload;
      const index = state.findIndex((chat) => {
        return chat.id === chatId;
      });
      if (index >= 0) {
        state[index].numOfUnreadMessages = 0;
      }
    },
  },
});

const selectedIds = createSlice({
  name: "selectedIds",
  initialState: [],
  reducers: {
    addSelectedId: (state, action) => {
      if (!state.includes(action.payload)) {
        // maximum 2 chat windows
        if (state.length >= 2) {
          state.splice(0, 1);
        }
        state.push(action.payload);
      }
    },
    removeSelectedId: (state, action) => {
      const index = state.indexOf(action.payload);
      if (index >= 0) {
        state.splice(index, 1);
      }
    },
  },
});

const reducer = combineReducers({
  chats: chats.reducer,
  selectedIds: selectedIds.reducer,
});

export const {
  addChat,
  editChat,
  refreshChats,
  addMessage,
  appendMessageToChat,
  editGroupAvatar,
  readChat,
  addNotification,
  addReadByUserName,
} = chats.actions;

export const { addSelectedId, removeSelectedId } = selectedIds.actions;
export default reducer;
