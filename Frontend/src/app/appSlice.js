import { combineReducers, createSlice } from "@reduxjs/toolkit";

const isLoading = createSlice({
  name: "isLoading",
  initialState: false,
  reducers: {
    setIsLoading: (state, action) => {
      state = action.payload;
      return state;
    },
  },
});

const popup = createSlice({
  name: "popup",
  initialState: {
    isOpen: false,
    content: "",
    title: "Notification",
  },
  reducers: {
    setPopup: (state, action) => {
      state = action.payload;
      return state;
    },
  },
});

const notifications = createSlice({
  name: "notifications",
  initialState: { items: [] },
  reducers: {
    addNotification: (state, action) => {
      state?.items?.push(action.payload);
    },
    loadNotification: (state, action) => {
      if (action.payload.page > state.page) {
        const notification = action.payload;
        state.totalRecords = notification.totalRecords;
        state.limit = notification.limit;
        state.page = notification.page;
        state.pageCount = notification.pageCount;
        state.items = state.items.concat(notification.items);
      }
    },
    readAllNotification: (state, action) => {
      state?.items?.filter((x) => !x.isRead)?.forEach((x) => (x.isRead = true));
    },
    readNotificationById: (state, action) => {
      const id = action.payload;
      const index = state.items?.findIndex((notification) => {
        return notification.id === id;
      });
      if (index >= 0) {
        state.items[index].isRead = true;
      }
    },
    refreshNotification: (state, action) => {
      state = action.payload;
      return state;
    },
  },
});

const reducer = combineReducers({
  isLoading: isLoading.reducer,
  popup: popup.reducer,
  notifications: notifications.reducer,
});

export const { setIsLoading } = isLoading.actions;
export const { setPopup } = popup.actions;
export const {
  addNotification,
  refreshNotification,
  readAllNotification,
  readNotificationById,
  loadNotification,
} = notifications.actions;
export default reducer;
