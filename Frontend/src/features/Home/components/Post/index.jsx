import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import moment from "moment";
import React, { useState } from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import CommentInput from "../CommentInput";
import CommentList from "../CommentList";

function Post({ post }) {
  const currentUser = useSelector((state) => state.users.currentUser);
  const [isOpenCommentList, setIsOpenCommentList] = useState(false);

  return (
    <>
      <div className="py-4 px-5 bg-white dark:bg-dark-secondary border dark:border-dark-hover w-full flex flex-col justify-start items-start space-y-4 rounded-xl shadow-lg">
        <div className="flex justify-between items-center w-full">
          <div className="flex space-x-2">
            <Link
              className="font-semibold text-sm cursor-pointer"
              to={`/profile/${post.creator.userName}`}
            >
              <ImageCircle
                src={post.creator.avatarUrl}
                userName={post?.creator?.userName}
              />
            </Link>
            <div className="flex flex-col justify-evenly">
              <Link
                className="font-semibold text-sm cursor-pointer hover:underline"
                to={`/profile/${post.creator.userName}`}
              >
                {post.creator.fullName}
              </Link>
              <Link
                className="text-xs text-gray-500 dark:text-dark-txt"
                to={`/post/${post.id}`}
              >
                {moment(new Date(post?.dateCreated), "YYYYMMDD")
                  .fromNow()
                  ?.replace("ago", "")
                  ?.trim()}
              </Link>
            </div>
          </div>
          <ClickableIcon
            iconClass="bx bx-dots-horizontal-rounded"
            colorClass="bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover"
          />
        </div>
        <span className="text-sm break-words overflow-ellipsis max-w-full">
          {post.content}
        </span>
        <div className="flex justify-between w-full text-xs text-gray-500 hover:underline">
          <span className="cursor-pointer">
            {post?.reactions?.length > 0 && post?.reactions?.length}
          </span>
          <span
            className="cursor-pointer"
            onClick={() => setIsOpenCommentList((preState) => !preState)}
          >
            {post?.comments?.length > 0 &&
              post?.comments?.length +
                " comment" +
                (post?.comments?.length > 1 ? "s" : "")}
          </span>
        </div>
        <div className="w-full text-center flex justify-between select-none cursor-pointer py-1 border-t border-b dark:border-dark-third space-x-1 text-gray-600 dark:text-dark-txt">
          <span className="flex-1 p-1 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base">
            <i className="bx bx-like mr-2 text-lg align-middle mb-1"></i>
            Like
          </span>
          <span
            className="flex-1 p-1 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base"
            onClick={() => setIsOpenCommentList((preState) => !preState)}
          >
            <i className="bx bx-comment mr-2 text-lg align-middle "></i>
            Comment
          </span>
          <span className="flex-1 p-1 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base ">
            <i className="bx bx-share bx-flip-horizontal mr-2 text-lg align-middle"></i>
            Share
          </span>
        </div>
        <CommentInput postId={post.id} currentUser={currentUser} />
        <CommentList
          postId={post.id}
          comments={post.comments}
          isOpen={isOpenCommentList}
          currentUser={currentUser}
        />
      </div>
    </>
  );
}

export default Post;
