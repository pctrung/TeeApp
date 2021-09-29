import { combineReducers, createSlice } from "@reduxjs/toolkit";
//import jwt from "jwt-decode";

const currentUser = createSlice({
  name: "currentUser",
  initialState: {},
  reducers: {
    setCurrentUser: (state, action) => {
      state = action.payload;
      return state;
    },
  },
});

const onlineUserNameList = createSlice({
  name: "onlineUserNameList",
  initialState: [],
  reducers: {
    updateOnlineUserNameList: (state, action) => {
      state = action.payload;
      return state;
    },
  },
});

const reducer = combineReducers({
  currentUser: currentUser.reducer,
  onlineUserNameList: onlineUserNameList.reducer,
});

export const { setCurrentUser } = currentUser.actions;
export const { updateOnlineUserNameList } = onlineUserNameList.actions;
export default reducer;

// function decodeCurrentUser() {
//   var token = window.localStorage.getItem("token");
//   if (token) {
//     const user = jwt(token);
//     return user;
//   }
//   return false;
// }
