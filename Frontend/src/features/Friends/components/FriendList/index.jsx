import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import ImageCircle from "components/ImageCircle";
import Pagination from "components/Pagination";
import useFriendApi from "hooks/api/useFriendApi.js";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import moment from "moment";
import React, { useEffect, useRef, useState } from "react";
import { Link } from "react-router-dom";

export default function FriendList({ keyword }) {
  const [list, setList] = useState({ items: [] });
  const [confirmModal, setConfirmModal] = useState({});
  const friendApi = useFriendApi();
  const [isLoading, setIsLoading] = useState(false);
  const [pagination, setPagination] = useState({ page: 1, keyword: "" });
  const [error, setError] = useState("");
  const [isHasMore, setIsHasMore] = useState(true);

  useEffect(() => {
    setPagination({ ...pagination, page: 1, keyword: keyword });
  }, [keyword]);
  useEffect(() => {
    // auto fetch data when page = 1
    if ((isHasMore && pagination?.page) || pagination.page === 1) {
      setIsLoading(true);
      setError(false);
      friendApi
        .getFriends(pagination)
        .then((response) => {
          if (pagination.page > 1) {
            setList({
              ...response,
              items: list.items.concat(response.items),
            });
          } else {
            setList(response);
          }
          setIsHasMore(pagination.page < response.pageCount);
          setIsLoading(false);
        })
        .catch((e) => {
          setError(e);
        });
    }
  }, [pagination?.page, pagination?.limit, pagination?.keyword]);

  function loadMore() {
    if (isHasMore) {
      setPagination({ ...pagination, page: pagination.page + 1 });
    }
  }
  return (
    <>
      {confirmModal?.isOpen && (
        <ConfirmModal
          isOpen={confirmModal.isOpen}
          closeAction={() => setConfirmModal({ isOpen: false })}
          title="Are you sure?"
          content={confirmModal.content}
          confirmButtonTitle="Yes"
          confirmButtonAction={confirmModal.action}
        />
      )}
      <div className="flex flex-col md:grid md:grid-cols-2 md:gap-10">
        {list?.items.map((friendship) => (
          <Friend
            setConfirmModal={setConfirmModal}
            friendship={friendship}
            user={friendship.user}
            fetchData={() => {
              setPagination({ page: 1 });
            }}
            key={friendship?.user?.id}
          />
        ))}
      </div>
      <Pagination
        loadMoreClassName="bg-gray-200 hover:bg-gray-300 mt-4"
        onClick={loadMore}
        isLoading={isLoading}
        error={error}
        isHasMore={isHasMore}
        loadMoreContent="Load more friends..."
      />
      {list?.totalRecords <= 0 && (
        <div className="text-center py-3 font-semibold mt-4 text-sm md:text-base">
          Not found any friends
          <br /> You should make more friends
        </div>
      )}
    </>
  );
}

const Friend = ({ friendship = {}, user = {}, setConfirmModal, fetchData }) => {
  const [isOpenMenu, setIsOpenMenu] = useState(false);
  const [isFriend, setIsFriend] = useState(true);
  const [isFollowing, setIsFollowing] = useState(friendship.isFollowing);
  const ref = useRef();
  const friendApi = useFriendApi();

  useCloseOnClickOutside(isOpenMenu, setIsOpenMenu, ref);

  useEffect(() => {
    setIsFollowing(friendship.isFollowing);
  }, [friendship]);

  function handleFriend() {
    if (friendApi) {
      if (isFriend) {
        openUnfriendModal();
      } else {
        friendApi.addFriend(user.userName).then((response) => {
          setIsFriend(true);
        });
      }
      setIsOpenMenu(false);
    }
  }
  function unfriend() {
    if (friendApi) {
      friendApi.unfriend(user.userName).then((response) => {
        setIsFriend(false);
      });
    }
  }
  function handleFollow() {
    if (friendApi) {
      if (isFollowing) {
        friendApi.unfollow(user.userName).then((response) => {
          setIsFollowing(false);
        });
      } else {
        friendApi.follow(user.userName).then((response) => {
          setIsFollowing(true);
        });
      }
    }
    setIsOpenMenu(false);
  }

  function block() {
    if (friendApi) {
      friendApi.block(user.userName).then((response) => {
        fetchData();
      });
    }
  }
  function openBlockModal() {
    setConfirmModal({
      isOpen: true,
      content: `Do you want to block ${user.fullName}?`,
      action: block,
    });
  }
  function openUnfriendModal() {
    setConfirmModal({
      isOpen: true,
      content: `Do you want to unfriend ${user.fullName}?`,
      action: unfriend,
    });
  }
  return (
    <div className="flex items-center justify-between w-full space-x-2">
      <Link
        to={`/profile/${user.userName}`}
        className="w-full p-2 flex justify-start items-center space-x-2 rounded-lg cursor-pointer select-none transition-base hover:bg-gray-100 dark:hover:bg-dark-third"
      >
        <ImageCircle src={user.avatarUrl} userName={user.userName} />
        <div className="w-full flex flex-col justify-center items-start">
          <div className="w-11/12 font-semibold truncate">{user.fullName}</div>
          <div className="text-xs dark:text-dark-txt text-gray-500">
            Your friend since {moment(friendship.respondedDate).format("LL")}
          </div>
        </div>
      </Link>
      <div ref={ref} className="relative">
        <ClickableIcon
          iconClass="bx bx-dots-horizontal-rounded"
          secondMode
          onClick={() => {
            setIsOpenMenu(!isOpenMenu);
          }}
        />
        {isOpenMenu && (
          <div className="animate-fadeIn transition-base absolute top-5 p-1 w-48 right-0 border border-gray-200 bg-white rounded-lg shadow-lg overflow-hidden dark:bg-dark-secondary dark:border-dark-hover mt-2 select-none z-10">
            <button
              className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-hover text-sm"
              onClick={handleFollow}
            >
              <i
                className={
                  "bx text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 mr-2" +
                  " " +
                  (isFollowing ? "bx-x-circle" : "bx-check-circle")
                }
              ></i>
              <span className="text-sm">
                {isFollowing ? "Unfollow" : "Follow"}
              </span>
            </button>
            <button
              className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-hover text-sm"
              onClick={handleFriend}
            >
              <i
                className={
                  "bx text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 mr-2" +
                  " " +
                  (isFriend ? "bx-user-x" : "bx-user-plus")
                }
              ></i>
              <span className="text-sm">
                {isFriend ? "Unfriend" : "Add friend"}
              </span>
            </button>
            <button
              className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-hover text-sm"
              onClick={() => {
                setIsOpenMenu(false);
                openBlockModal();
              }}
            >
              <i className="bx bx-block text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 mr-2"></i>
              <span className="text-sm">Block</span>
            </button>
          </div>
        )}
      </div>
    </div>
  );
};
