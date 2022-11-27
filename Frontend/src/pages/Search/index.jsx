import Pagination from "components/Pagination";
import Post from "features/Home/components/Post";
import useAllPostPagination from "hooks/pagination/useAllPostPagination";
import React, { useEffect, useState } from "react";
import { useParams, useHistory } from "react-router-dom";
import { DefaultPagination } from "utils/Constants";

function Search() {
  const history = useHistory();
  const { keyword } = useParams();
  const [searchKeyword, setSearchKeyword] = useState("");
  const [pagination, setPagination] = useState(DefaultPagination);
  const { posts, isHasMore, isLoading, error } =
    useAllPostPagination(pagination);

  useEffect(() => {
    if (keyword) {
      setPagination({ ...pagination, keyword, page: 1 });
    } else {
      setPagination({ ...pagination, keyword, page: -1 });
    }
  }, [keyword]);
  function loadMore() {
    if (isHasMore) {
      setPagination({ ...pagination, keyword, page: pagination.page + 1 });
    }
  }
  const search = (e) => {
    e.preventDefault();
    history.push("/search/" + searchKeyword);
  };
  return (
    <>
      <form
        onSubmit={(e) => search(e)}
        className="sticky top-16 md:hidden mb-4 z-20"
      >
        <input
          type="search"
          className="bg-gray-200 dark:bg-dark-third dark:text-white rounded-full outline-none pl-10 pr-3 py-2 focus:ring-2 ring-green-400 ring-opacity-50 transition-base w-full"
          placeholder="Search TeeApp!"
          value={searchKeyword}
          onChange={(e) => setSearchKeyword(e.target.value)}
        />
        <i className="bx bx-search absolute text-xl top-1/2 left-3 transform text-gray-400 -translate-y-1/2 cursor-pointer"></i>
      </form>
      <div className="w-full flex flex-cols items-start justify-between animate-fadeIn space-x-2">
        <div className="space-y-2 md:space-y-3 lg:min-w-600 md:min-w-500 w-full flex flex-col items-center">
          {[...posts?.items]
            ?.sort((a, b) => (a.dateCreated < b.dateCreated ? 1 : -1))
            ?.map((post) => (
              <Post key={post.id} post={post} />
            ))}
          {pagination.page !== -1 && (
            <Pagination
              loadMoreClassName="bg-gray-200 hover:bg-gray-300"
              onClick={loadMore}
              isLoading={isLoading}
              error={error}
              isHasMore={isHasMore}
              loadMoreContent="Load more posts..."
            />
          )}
          {pagination.page === -1 && (
            <div className="text-center py-3 font-semibold">
              Please enter keywords to search
            </div>
          )}
          {posts?.totalRecords <= 0 && (
            <div className="text-center py-3 font-semibold">
              No posts found for: "{keyword}"
            </div>
          )}
        </div>
      </div>
    </>
  );
}

export default Search;
