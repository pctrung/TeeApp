import LoadingSpinner from "components/LoadingSpinner";
import React from "react";

function Pagination({
  isHasMore,
  isLoading,
  error,
  onClick,
  loadMoreContent = "Load more...",
  loadMoreClassName = "",
  className = "",
}) {
  return (
    <div className={className}>
      {isHasMore && !isLoading && (
        <div className="flex">
          <button
            className={
              "mx-auto px-4 bg-gray-100 py-2 rounded-lg transform active:scale-95 hover:bg-gray-200 dark:hover:bg-dark-hover dark:bg-dark-third dark:text-gray-300 text-xs md:text-sm transition-all duration-200" +
              " " +
              loadMoreClassName
            }
            onClick={onClick}
          >
            {loadMoreContent}
          </button>
        </div>
      )}
      {isLoading && (
        <div className="flex justify-center mt-2">
          <LoadingSpinner />
        </div>
      )}
      {error && <div className="text-red-500 text-center ">{error}</div>}
    </div>
  );
}

export default Pagination;
