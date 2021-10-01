import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import moment from "moment";
import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import CommentInput from "../CommentInput";
import CommentList from "../CommentList";
import ReactionInput from "../ReactionInput";
import {
  ReactionIcon,
  ReactionName,
  ReactionColor,
  ReactionType,
} from "utils/Enums";
import usePostApi from "hooks/usePostApi";
import { groupBy } from "utils/ExtensionMethod";

function Post({ post }) {
  const currentUser = useSelector((state) => state.users.currentUser);
  const [isOpenCommentList, setIsOpenCommentList] = useState(false);
  const [topThreeType, setTopThreeType] = useState();
  const postApi = usePostApi();

  const reacted = post?.reactions?.find(
    (x) => x.creator.userName === currentUser.userName,
  );

  const addLike = () => {
    if (!reacted) {
      postApi.addReaction(post.id, { type: ReactionType.LIKE });
    } else if (reacted && reacted.type !== ReactionType.LIKE) {
      postApi.updateReaction(post.id, { type: ReactionType.LIKE });
    }
  };
  const deleteReaction = () => {
    if (reacted) {
      postApi.deleteReaction(post.id);
    }
  };
  const topThreeReaction = (post) => {
    const group = groupBy(post.reactions, ["type"]);
    var topThree = [];
    for (const key in group) {
      topThree.push({ type: key, total: group[key].length });
    }

    return topThree
      .sort((a, b) => (a.total > b.total ? 1 : -1))
      .slice(0, 3)
      .map((x) => x.type);
  };
  useEffect(() => {
    setTopThreeType(topThreeReaction(post));
  }, [post]);
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
                className="text-xs text-gray-500 dark:text-dark-txt hover:underline"
                to={`/post/${post.id}`}
              >
                {moment(new Date(post?.dateCreated), "YYYYMMDD")
                  .fromNow()
                  ?.replace("ago", "")
                  ?.trim()}
              </Link>
            </div>
          </div>
          {post?.creator?.userName === currentUser?.userName && (
            <ClickableIcon
              iconClass="bx bx-dots-horizontal-rounded"
              colorClass="bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover"
            />
          )}
        </div>
        <span className="text-sm break-words overflow-ellipsis max-w-full">
          {post.content}
        </span>
        <div className="flex justify-between w-full text-xs text-gray-500 hover:underline">
          <div className="cursor-pointer flex space-x-1">
            <div className="flex">
              {topThreeType &&
                topThreeType.map((type, index) => (
                  <div
                    key={type}
                    className={"w-5 h-5 " + (index > 0 ? "z-0" : "z-10")}
                  >
                    <img
                      src={ReactionIcon[type]}
                      alt={ReactionName[type]}
                      className={
                        "w-full h-full border-2 border-white dark:border-dark-secondary rounded-full" +
                        " " +
                        (index > 0 ? "transform -translate-x-1" : "")
                      }
                    />
                  </div>
                ))}
            </div>
            <span className="cursor-pointer text-gray-500 dark:text-dark-txt">
              {post?.reactions?.length > 0 && post?.reactions?.length}
            </span>
          </div>
          <span
            className="cursor-pointer text-gray-500 dark:text-dark-txt"
            onClick={() => setIsOpenCommentList((preState) => !preState)}
          >
            {post?.comments?.length > 0 &&
              post?.comments?.length +
                " comment" +
                (post?.comments?.length > 1 ? "s" : "")}
          </span>
        </div>
        <div className="w-full text-center flex justify-between select-none cursor-pointer py-1 border-t border-b dark:border-dark-third space-x-1 text-gray-600 dark:text-dark-txt font-semibold text-sm">
          <span className="relative flex-1 transition-base group">
            <ReactionInput
              postId={post.id}
              reacted={reacted}
              className="absolute bottom-full left-0 hidden group-hover:flex"
            />
            {reacted ? (
              <>
                <div
                  className="w-full p-1 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base"
                  onClick={deleteReaction}
                >
                  <div className="flex justify-center items-center space-x-2">
                    <div className="w-5">
                      <img
                        src={ReactionIcon[reacted.type]}
                        alt={ReactionName[reacted.type]}
                        className="animate-popup w-full h-full"
                      />
                    </div>

                    <span className={ReactionColor[reacted.type]}>
                      {ReactionName[reacted.type]}
                    </span>
                  </div>
                </div>
              </>
            ) : (
              <div
                className="w-full p-1 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base"
                onClick={addLike}
              >
                <span>
                  <i className="bx bx-like mr-2 text-lg align-middle mb-1"></i>
                  Like
                </span>
              </div>
            )}
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

export default React.memo(Post);
