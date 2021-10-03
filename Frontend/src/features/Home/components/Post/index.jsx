import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import ImageCircle from "components/ImageCircle";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import usePostApi from "hooks/api/usePostApi";
import moment from "moment";
import React, { useEffect, useRef, useState } from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import {
  PrivacyIcon,
  ReactionColor,
  ReactionIcon,
  ReactionName,
  ReactionType,
} from "utils/Enums";
import { groupBy } from "utils/ExtensionMethod";
import CommentInput from "../CommentInput";
import CommentList from "../CommentList";
import EditPost from "../EditPost";
import PhotoList from "../PhotoList";
import ReactionInput from "../ReactionInput";

function Post({ post }) {
  const currentUser = useSelector((state) => state.users.currentUser);
  const [isOpenEdit, setIsOpenEdit] = useState(false);
  const [isOpenReaction, setIsOpenReaction] = useState(false);
  const [isOpenCommentList, setIsOpenCommentList] = useState(false);
  const [isOpenMenu, setIsOpenMenu] = useState(false);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [topThreeType, setTopThreeType] = useState();
  const postApi = usePostApi();
  const ref = useRef();
  const reactionRef = useRef();

  const reacted = post?.reactions?.find(
    (x) => x.creator.userName === currentUser.userName,
  );

  const addLike = () => {
    if (!reacted) {
      postApi.addReaction(post.id, { type: ReactionType.LIKE });
    } else if (reacted && reacted.type !== ReactionType.LIKE) {
      postApi.updateReaction(post.id, { type: ReactionType.LIKE });
    }
    setIsOpenReaction(false);
  };
  const deleteReaction = () => {
    if (reacted) {
      postApi.deleteReaction(post.id);
    }
    setIsOpenReaction(false);
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

  useCloseOnClickOutside(isOpenMenu, setIsOpenMenu, ref);

  const deletePost = () => {
    if (post.id) {
      postApi.deletePost(post.id);
    }
  };
  return (
    <>
      {isOpenConfirm && (
        <ConfirmModal
          isOpen={isOpenConfirm}
          closeAction={() => setIsOpenConfirm(false)}
          title="Are you sure?"
          content="Do you want to delete this post?"
          confirmButtonTitle="Yes"
          confirmButtonAction={() => deletePost()}
        />
      )}
      {isOpenEdit && (
        <EditPost post={post} isOpen={isOpenEdit} setIsOpen={setIsOpenEdit} />
      )}
      <div className="py-4 px-5 bg-white dark:bg-dark-secondary border dark:border-dark-hover w-full flex flex-col justify-start items-start space-y-3 rounded-xl shadow">
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
                className="text-xs text-gray-500 dark:text-dark-txt hover:underline space-x-2"
                to={`/post/${post.id}`}
              >
                <span>
                  {moment(new Date(post?.dateCreated), "YYYYMMDD")
                    .fromNow()
                    ?.replace("ago", "")
                    ?.trim()}
                </span>
                <i className={PrivacyIcon[post?.privacy]}></i>
              </Link>
            </div>
          </div>
          {post?.creator?.userName === currentUser?.userName && (
            <div className="relative" ref={ref}>
              <ClickableIcon
                iconClass="bx bx-dots-horizontal-rounded"
                secondMode
                onClick={() => setIsOpenMenu(!isOpenMenu)}
              />
              {isOpenMenu && (
                <div className="animate-fadeIn transition-base absolute top-full right-0 border border-gray-200 bg-white w-48 rounded-lg shadow-lg overflow-hidden p-2 dark:bg-dark-secondary dark:border-dark-hover mt-2 select-none z-10">
                  <button
                    className="flex items-center space-x-3 w-full pl-2 pr-4 py-2 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                    onClick={() => setIsOpenEdit(true)}
                  >
                    <i className="text-center-middle bx bx-edit-alt text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7"></i>
                    <span>Edit post</span>
                  </button>
                  <button
                    className="flex items-center space-x-3 w-full pl-2 pr-4 py-2 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                    onClick={() => setIsOpenConfirm(true)}
                  >
                    <i className="text-center-middle bx bx-trash text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7"></i>
                    <span>Delete post</span>
                  </button>
                </div>
              )}
            </div>
          )}
        </div>
        <span className="text-sm break-words overflow-ellipsis max-w-full">
          {post.content}
        </span>

        {post?.photos?.length > 0 && (
          <div className="w-full max-h-500 cursor-pointer">
            <PhotoList photos={post.photos} />{" "}
          </div>
        )}

        <div className="flex justify-between w-full text-xs text-gray-500 hover:underline pt-2">
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
          <span
            className="relative flex-1 transition-base"
            ref={reactionRef}
            onMouseOver={() => setIsOpenReaction(true)}
            onMouseLeave={() => setIsOpenReaction(false)}
          >
            {isOpenReaction && (
              <ReactionInput
                setIsOpen={setIsOpenReaction}
                reactionRef={reactionRef}
                postId={post.id}
                reacted={reacted}
                className="absolute bottom-full left-0"
              />
            )}
            {reacted ? (
              <>
                <div
                  className="w-full p-1 py-2 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base"
                  onClick={deleteReaction}
                >
                  <div className="flex-center space-x-2">
                    <img
                      src={ReactionIcon[reacted.type]}
                      alt={ReactionName[reacted.type]}
                      className="animate-popup w-5 h-5"
                    />
                    <span className={ReactionColor[reacted.type]}>
                      {ReactionName[reacted.type]}
                    </span>
                  </div>
                </div>
              </>
            ) : (
              <div
                className="w-full p-1 py-2 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base"
                onClick={addLike}
              >
                <span>
                  <i className="bx bx-like mr-2 text-lg align-middle"></i>
                  Like
                </span>
              </div>
            )}
          </span>
          <span
            className="flex-1 p-1 py-2 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base"
            onClick={() => setIsOpenCommentList((preState) => !preState)}
          >
            <i className="bx bx-comment mr-2 text-lg align-middle "></i>
            Comment
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
