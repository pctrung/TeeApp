import React, { useState } from "react";
import { FriendOption, FriendOptionType } from "./utils/Constants";
import BlockedList from "./components/BlockedList";
import FollowerList from "./components/FollowerList";
import FollowingList from "./components/FollowingList";
import FriendList from "./components/FriendList";
import FriendRequestList from "./components/FriendRequestList";
import AllUserList from "./components/AllUserList";
import { useDebounce } from "hooks/api/useDebounce";

function Friends() {
  const [keyword, setKeyword] = useState("");
  const debounceKeyword = useDebounce(keyword);

  const [activeTabType, setActiveTabType] = useState(FriendOptionType.FRIENDS);

  return (
    <>
      <div className="w-full max-w-screen-lg mx-auto rounded-xl bg-white dark:bg-dark-secondary px-5 py-4 pb-6 flex flex-col space-y-4">
        <div className="flex justify-between items-center">
          <span className="font-bold md:text-2xl text-xl">Friends</span>
          <div className="relative">
            <input
              type="search"
              className="bg-gray-100 dark:bg-dark-third dark:text-white rounded-full outline-none pl-10 pr-3 py-2 focus:ring-2 ring-green-400 ring-opacity-50 transition-base text-sm md:text-base"
              placeholder="Search friends!"
              value={keyword}
              onChange={(e) => setKeyword(e.target.value)}
            />
            <i className="bx bx-search absolute text-xl top-1/2 left-3 transform text-gray-400 -translate-y-1/2 cursor-pointer"></i>
          </div>
        </div>
        <div className="flex overflow-x-auto w-full justify-start items-center flex-shrink-0">
          {FriendOption.map((tab) => (
            <span
              key={"Friend option " + tab.name}
              onClick={() => setActiveTabType(tab.type)}
              className={
                "text-sm md:text-base font-semibold px-4 py-4 cursor-pointer select-none transition-base border-b-4 " +
                " " +
                (tab.type === activeTabType
                  ? "text-green-600 dark:text-green-400 border-green-500"
                  : "hover:bg-gray-100 active:bg-gray-200 dark:hover:bg-dark-hover dark:active:bg-dark-third rounded-lg border-transparent active:transform active:scale-95")
              }
            >
              {tab.name}
            </span>
          ))}
        </div>
        <div className="pt-2">
          {activeTabType === FriendOptionType.FRIENDS && (
            <FriendList keyword={debounceKeyword} />
          )}
          {activeTabType === FriendOptionType.FRIEND_REQUESTS && (
            <FriendRequestList keyword={debounceKeyword} />
          )}
          {activeTabType === FriendOptionType.BLOCKED && (
            <BlockedList keyword={debounceKeyword} />
          )}
          {activeTabType === FriendOptionType.FOLLOWERS && (
            <FollowerList keyword={debounceKeyword} />
          )}
          {activeTabType === FriendOptionType.FOLLOWING && (
            <FollowingList keyword={debounceKeyword} />
          )}
          {activeTabType === FriendOptionType.ALL && (
            <AllUserList keyword={debounceKeyword} />
          )}
        </div>
      </div>
    </>
  );
}

export default Friends;
