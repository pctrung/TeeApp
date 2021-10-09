import ImageCircle from "components/ImageCircle";
import useUserApi from "hooks/api/useUserApi";
import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";

export default function OnlineUserList() {
  const userApi = useUserApi();
  const [users, setUsers] = useState([]);
  const [onlineUsers, setOnlineUsers] = useState([]);
  const onlineUserNameList = useSelector(
    (state) => state.users.onlineUserNameList,
  );

  useEffect(() => {
    userApi.getUserList().then((response) => {
      setUsers(response.items);
    });
  }, []);
  useEffect(() => {
    const online = users.filter((x) => onlineUserNameList.includes(x.userName));
    setOnlineUsers(online);
  }, [onlineUserNameList]);

  return (
    <>
      <div className="w-full h-full flex flex-col space-y-3 bg-white dark:bg-dark-secondary rounded-lg p-4">
        <span className="font-bold text-lg">Online</span>
        <div className="flex flex-col select-none">
          {onlineUsers.map((user) => (
            <div
              key={user.id}
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
