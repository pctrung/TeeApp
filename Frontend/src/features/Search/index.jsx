import Pagination from "components/Pagination";
import Post from "features/Home/components/Post";
import useAllPostPagination from "hooks/pagination/useAllPostPagination";
import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

function Search() {
  const { keyword } = useParams();
  const [pagination, setPagination] = useState({ page: 1 });
  const { posts, isHasMore, isLoading, error } =
    useAllPostPagination(pagination);

  useEffect(() => {
    setPagination({ keyword, page: 1 });
  }, [keyword]);
  function loadMore() {
    if (isHasMore) {
      setPagination({ keyword, page: pagination.page + 1 });
    }
  }
  return (
    <>
      <div className="w-full flex flex-cols items-start justify-between animate-fadeIn space-x-2">
        <div className="space-y-2 md:space-y-3 lg:min-w-600 md:min-w-500 w-full flex flex-col items-center">
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
              Not found any posts with keyword: "{keyword}".
            </div>
          )}
        </div>
      </div>
    </>
  );
}

export default Search;
