import Button from "components/Button";
import ConfirmModal from "components/ConfirmModal";
import ImageCircle from "components/ImageCircle";
import Pagination from "components/Pagination";
import useFriendApi from "hooks/api/useFriendApi.js";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { DefaultPagination } from "utils/Constants";

export default function FollowerList({ keyword }) {
  const [list, setList] = useState({ items: [] });
  const [confirmModal, setConfirmModal] = useState({});
  const friendApi = useFriendApi();
  const [isLoading, setIsLoading] = useState(false);
  const [pagination, setPagination] = useState(DefaultPagination);
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
        .getFollowers(pagination)
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
      <div className="grid md:grid-cols-5 grid-cols-2 gap-3">
        {list?.items.map((user) => (
          <Friend
            setConfirmModal={setConfirmModal}
            user={user}
            fetchData={() => {
              setPagination({ page: 1 });
            }}
            key={user?.id}
          />
        ))}
      </div>
      <Pagination
        loadMoreClassName="bg-gray-200 hover:bg-gray-300 mt-4"
        onClick={loadMore}
        isLoading={isLoading}
        error={error}
        isHasMore={isHasMore}
        loadMoreContent="Load more followers..."
      />
      {list?.totalRecords <= 0 && (
        <div className="text-center py-3 font-semibold mt-4 text-sm md:text-base">
          You have no followers
        </div>
      )}
    </>
  );
}

const Friend = ({ user = {}, setConfirmModal, fetchData }) => {
  const friendApi = useFriendApi();

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
  return (
    <div className="flex-center flex-col w-full space-y-1">
      <Link
        to={`/profile/${user.userName}`}
        className="w-full p-3 flex-center flex-col space-y-3 rounded-lg cursor-pointer select-none transition-base hover:bg-gray-100 dark:hover:bg-dark-third"
      >
        <ImageCircle size="xl" src={user.avatarUrl} userName={user.userName} />
        <div className="w-full font-semibold truncate text-center">
          {user.fullName}
        </div>
      </Link>
      <div className="flex flex-col space-y-1 w-full">
        <Button small secondary onClick={openBlockModal} className="w-full">
          Block
        </Button>
      </div>
    </div>
  );
};
