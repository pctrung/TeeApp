import React from "react";
import { GenderName } from "utils/Enums";
import { formatDate } from "utils/UtilityMethods";

function UserInfo({ user, className }) {
  return (
    <>
      <div
        className={
          "md:max-w-xs max-w-xl min-w-0 bg-white dark:bg-dark-secondary w-full rounded-xl shadow px-5 py-4 space-y-3" +
          " " +
          className
        }
      >
        <div className="text-lg font-semibold w-full border-b dark:border-dark-hover pb-2 text-green-600 dark:text-green-400">
          Personal Detail
        </div>
        <div className="flex flex-col space-y-2">
          <div className="flex flex-col">
            <span className="text-sm text-gray-500 dark:text-dark-txt">
              Name{" "}
            </span>
            <span className="font-medium max-row-2">{user.fullName}</span>
          </div>
          <div className="flex flex-col">
            <span className="text-sm text-gray-500 dark:text-dark-txt">
              Nickname{" "}
            </span>
            <span className="font-medium max-row-2">
              {user.nickName ? user.nickName : "--"}
            </span>
          </div>
          <div className="flex flex-col">
            <span className="text-sm text-gray-500 dark:text-dark-txt">
              Gender{" "}
            </span>
            <span className="font-medium max-row-2">
              {GenderName[user.gender]}
            </span>
          </div>
          <div className="flex flex-col">
            <span className="text-sm text-gray-500 dark:text-dark-txt">
              Birthday{" "}
            </span>
            <span className="font-medium max-row-2">
              {new Date(user.dateOfBirth).getFullYear() > 1
                ? formatDate(user.dateOfBirth)
                : "--"}
            </span>
          </div>
          <div className="flex flex-col">
            <span className="text-sm text-gray-500 dark:text-dark-txt">
              Phone{" "}
            </span>
            <span className="font-medium max-row-2">
              {user.phoneNumber ? user.phoneNumber : "--"}
            </span>
          </div>
          <div className="flex flex-col">
            <span className="text-sm text-gray-500 dark:text-dark-txt">
              Email{" "}
            </span>
            <span className="font-medium max-row-2 break-all">
              {user.email ? user.email : "--"}
            </span>
          </div>
        </div>
      </div>
    </>
  );
}

export default UserInfo;
