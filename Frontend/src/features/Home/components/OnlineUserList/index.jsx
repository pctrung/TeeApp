import { addSelectedId } from "app/chatSlice";
import ImageCircle from "components/ImageCircle";
import useChatApi from "hooks/api/useChatApi";
import useUserApi from "hooks/api/useUserApi";
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { useSelector } from "react-redux";
import { useLocation } from "react-router";

export default function OnlineUserList() {
  const userApi = useUserApi();
  const chatApi = useChatApi();
  const location = useLocation();
  const dispatch = useDispatch();
  const [users, setUsers] = useState([]);
  const [onlineUsers, setOnlineUsers] = useState([]);
  const onlineUserNameList = useSelector(
    (state) => state.users.onlineUserNameList,
  );

  useEffect(() => {
    userApi.getUserList().then((response) => {
      setUsers(response.items);
    });
  }, [location.pathname]);
  useEffect(() => {
    const online = users.filter((x) => onlineUserNameList.includes(x.userName));
    setOnlineUsers(online);
  }, [onlineUserNameList, users]);

  async function handleCreateChat(userName) {
    const request = {
      participantUserName: userName,
    };
    chatApi.createPrivateChat(request).then((response) => {
      if (response.id) {
        dispatch(addSelectedId(response.id));
      }
    });
  }
  return (
    <>
      <div className="w-full h-full flex flex-col space-y-3 bg-white dark:bg-dark-secondary rounded-lg p-4 shadow">
        <span className="font-bold text-lg">Online</span>
        <div className="flex flex-col select-none">
          {onlineUsers.map((user) => (
            <div
              key={user.id}
              onClick={() => handleCreateChat(user.userName)}
              className="flex items-center space-x-2 px-1 rounded-lg py-2 clickable active:scale-95 active:transform transition-base"
            >
              <ImageCircle
                size="sm"
                userName={user.userName}
                src={user.avatarUrl}
              />
              <span className="font-semibold text-sm truncate w-full">
                {user.fullName}
              </span>
            </div>
          ))}
        </div>
      </div>
    </>
  );
}
