import React from "react";
import ImageCircle from "components/ImageCircle";
import { Link } from "react-router-dom";
import moment from "moment";
import ClickableIcon from "components/ClickableIcon";

function Post({ post }) {
  return (
    <>
      <div className="py-3 px-5 bg-white dark:bg-dark-secondary w-full flex flex-col justify-start items-start space-y-3 rounded-xl shadow-lg">
        <div className="flex justify-between items-center w-full">
          <div className="flex space-x-2">
            <Link
              className="font-semibold text-sm cursor-pointer"
              to={`/profile/${post.creator.userName}`}
            >
              <ImageCircle src={post.creator.avatarUrl} />
            </Link>
            <div className="flex flex-col justify-evenly">
              <Link
                className="font-semibold text-sm cursor-pointer"
                to={`/profile/${post.creator.userName}`}
              >
                {post.creator.fullName}
              </Link>
              <Link className="text-xs" to={`/post/${post.id}`}>
                {moment(new Date(post?.dateCreated), "YYYYMMDD")
                  .fromNow()
                  ?.replace("ago", "")
                  ?.trim()}
              </Link>
            </div>
          </div>
          <ClickableIcon iconClass="bx bx-dots-horizontal-rounded" />
        </div>
        <span className="text-sm">{post.content}</span>
      </div>
    </>
  );
}

export default Post;
