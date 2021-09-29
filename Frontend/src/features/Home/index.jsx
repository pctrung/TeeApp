import { refreshPost } from "app/postSlice";
import Pagination from "components/Pagination";
import SideBar from "features/Home/components/SideBar";
import usePostApi from "hooks/usePostApi";
import usePostPagination from "hooks/usePostPagination";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import Post from "./components/Post";

function Home() {
  const [page, setPage] = useState(1);
  const posts = useSelector((state) => state.posts.posts);
  const { isHasMore, isLoading, error } = usePostPagination(posts, page);
  const dispatch = useDispatch();
  const postApi = usePostApi();

  useEffect(() => {
    postApi.getAll().then((response) => {
      dispatch(refreshPost(response));
    });
  }, []);

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
          {posts?.items?.map((post, index) => (
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
