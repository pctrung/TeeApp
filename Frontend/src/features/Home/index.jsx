import ImageCircle from "components/ImageCircle";
import Pagination from "components/Pagination";
import DefaultCover from "assets/img/default-cover.jpg";
import usePostPagination from "hooks/pagination/usePostPagination";
import React, { useState } from "react";
import { useSelector } from "react-redux";
import CreatePost from "./components/CreatePost";
import Post from "./components/Post";
import { Link } from "react-router-dom";
import OnlineUserList from "./components/OnlineUserList";

function Home() {
  const [page, setPage] = useState(1);
  const { posts, isHasMore, isLoading, error } = usePostPagination(page);
  const user = useSelector((state) => state.users.currentUser);

  function loadMore() {
    if (isHasMore) {
      setPage((prevPage) => prevPage + 1);
    }
  }
  return (
    <>
      <div className="w-full flex flex-cols items-start justify-between animate-fadeIn space-x-2">
        <div className="sticky top-20 lg:block hidden w-full bg-white dark:bg-dark-secondary rounded-lg">
          <div className="flex flex-col items-center w-full">
            <Link
              to={`/profile/${user.userName}`}
              className="relative h-20 w-full flex mb-6 select-none"
            >
              <img
                src={user?.coverUrl ?? DefaultCover}
                alt={`${user?.fullName} cover`}
                className="w-full object-cover rounded-lg cursor-pointer"
              />
              <div className="absolute rounded-full left-1/2 transform bottom-0 translate-y-5 -translate-x-1/2 border-2 border-white dark:border-dark-secondary ring-2 ring-green-400 dark:ring-green-500 cursor-pointer">
                <ImageCircle src={user?.avatarUrl} size="lg" />
              </div>
            </Link>
            <div className="w-full mx-4 dark:border-dark-hover pb-6 space-y-2">
              <Link to={`/profile/${user.userName}`}>
                <div className="w-full text-center font-semibold hover:underline text-lg max-row-2">
                  {user.fullName}{" "}
                </div>
                {user.nickName && (
                  <div className="font-normal text-center">{`(${user.nickName})`}</div>
                )}
              </Link>
              <div className="mx-3 text-center text-sm">{user.aboutMe}</div>
            </div>
          </div>
        </div>
        <div className="space-y-2 md:space-y-3 lg:min-w-600 md:min-w-500 w-full flex flex-col items-center">
          <CreatePost />
          {[...posts?.items]
            ?.sort((a, b) => (a.dateCreated < b.dateCreated ? 1 : -1))
            ?.map((post) => (
              <Post key={post.id} post={post} />
            ))}
          <Pagination
            loadMoreClassName="bg-gray-200 hover:bg-gray-300"
            onClick={loadMore}
            isLoading={isLoading}
            error={error}
            isHasMore={isHasMore}
            loadMoreContent="Load more posts..."
          />
          {posts?.totalRecords <= 0 && (
            <div className="text-center py-3 font-semibold">
              Not found any posts.
              <br /> You should create first post or add more friends.
            </div>
          )}
        </div>
        <div className="sticky top-20 md:block hidden w-full">
          <OnlineUserList />
        </div>
      </div>
    </>
  );
}

export default Home;
