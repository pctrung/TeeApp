import Pagination from "components/Pagination";
import usePostPagination from "hooks/pagination/usePostPagination";
import React, { useState } from "react";
import CreatePost from "./components/CreatePost";
import Post from "./components/Post";

function Home() {
  const [page, setPage] = useState(1);
  const { posts, isHasMore, isLoading, error } = usePostPagination(page);

  function loadMore() {
    if (isHasMore) {
      setPage((prevPage) => prevPage + 1);
    }
  }
  return (
    <>
      <div className="w-full flex flex-cols animate-fadeIn">
        <div className="mx-auto space-y-2 md:space-y-3 w-600 flex flex-col items-center">
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
      </div>
    </>
  );
}

export default Home;
