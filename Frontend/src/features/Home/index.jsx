import Pagination from "components/Pagination";
import SideBar from "features/Home/components/SideBar";
import usePostPagination from "hooks/usePostPagination";
import React, { useState } from "react";
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
      <div className="container grid md:grid-cols-12 xl:gap-16 lg:gap-10 md:gap-6 animate-fadeIn">
        <SideBar className="hidden md:block md:col-span-3 sticky top-20" />
        <div className="md:col-span-9 lg:col-span-6 w-full mx-auto space-y-4">
          {[...posts?.items]
            ?.sort((a, b) => (a.dateCreated < b.dateCreated ? 1 : -1))
            ?.map((post, index) => (
              <Post key={Math.random() + index} post={post} />
            ))}
          <Pagination
            loadMoreClassName="bg-gray-200 hover:bg-gray-300"
            onClick={loadMore}
            isLoading={isLoading}
            error={error}
            isHasMore={isHasMore}
            loadMoreContent="Load more posts..."
          />
        </div>
        <SideBar className="hidden lg:block md:col-span-3 sticky top-20" />
      </div>
    </>
  );
}

export default Home;
