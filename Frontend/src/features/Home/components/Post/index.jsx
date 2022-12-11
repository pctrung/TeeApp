import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import Popup from "components/Popup";
import ImageCircle from "components/ImageCircle";
import Input from "components/Input";
import usePostApi from "hooks/api/usePostApi";
import usePostReportApi from "hooks/api/usePostReportApi";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
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
import { formatDate, groupBy } from "utils/UtilityMethods";
import CommentInput from "../CommentInput";
import CommentList from "../CommentList";
import EditPost from "../EditPost";
import PhotoList from "../PhotoList";
import ReactionInput from "../ReactionInput";

function Post({ post, isOpenComment = false }) {
  const currentUser = useSelector((state) => state.users.currentUser);
  const [isOpenEdit, setIsOpenEdit] = useState(false);

  const [isOpenReportModal, setIsOpenReportModal] = useState(false);
  const [isOpenReportSuccessModal, setIsOpenReportSuccessModal] = useState(false);
  const [reportContent, setReportContent] = useState("");

  const [isOpenReaction, setIsOpenReaction] = useState(false);
  const [isOpenCommentList, setIsOpenCommentList] = useState(isOpenComment);
  const [isOpenMenu, setIsOpenMenu] = useState(false);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [topThreeType, setTopThreeType] = useState();

  const postApi = usePostApi();
  const postReportApi = usePostReportApi();
  const ref = useRef();
  const reactionRef = useRef();

  const reacted = post?.reactions?.find(
    (x) => x.creator?.userName === currentUser?.userName,
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
    if (post?.reactions) {
      const group = groupBy(post.reactions, ["type"]);
      var topThree = [];
      for (const key in group) {
        topThree.push({ type: key, total: group[key].length });
      }
      return topThree
        .sort((a, b) => (a.total < b.total ? 1 : -1))
        .slice(0, 3)
        .map((x) => x.type);
    }
    return [];
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
  const reportPost = async () => {
    if (post.id) {
      setIsOpenReportModal(false);
      await postReportApi.add({ postId: post.id, content: reportContent });
      setReportContent("");
      setIsOpenReportSuccessModal(true);
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
      {isOpenReportModal && (
        <ConfirmModal
          isOpen={isOpenReportModal}
          closeAction={() => setIsOpenReportModal(false)}
          title="Are you sure?"
          content={<div className="w-full mt-4 space-y-3">
            <label
              htmlFor="reportContent"
              className="md:text-base text-sm dark:text-dark-txt"
            >
              Please enter problem. If someone is in immediate danger, get help before reporting to TeeApp. Don't wait.
            </label>
            <Input
              id="reportContent"
              value={reportContent}
              onChange={(e) => setReportContent(e.target.value)}
            />
          </div>}
          confirmButtonTitle="Submit"
          confirmButtonAction={() => reportPost()}
        />
      )}
      <Popup
        title={"Report success"}
        isOpen={isOpenReportSuccessModal}
        content={"Thank you for your report. We will review it as soon as possible."}
        onClick={() => setIsOpenReportSuccessModal(false)}
      />
      {isOpenEdit && (
        <EditPost post={post} isOpen={isOpenEdit} setIsOpen={setIsOpenEdit} />
      )}
      <div className="py-4 px-5 max-w-xl md:min-w-500 min-w-200 w-full mx-auto bg-white dark:bg-dark-secondary flex flex-col justify-start items-start space-y-3 rounded-xl shadow relative">
        {post?.isHideByAdmin && <div style={{zIndex: 5}} className="flex items-center justify-center bg-gray-800 h-full w-full bg-opacity-60 absolute inset-0 rounded-xl">
          <div className="p-4 text-red-500 bg-white bg-opacity-90 rounded-lg">
            <div>This post has been hidden by admin.</div>
            <div>{post?.hideByAdminNote ? `Note: ${post?.hideByAdminNote}` : ""}</div>
            <div>Please contact administration for more detail!</div>
          </div>
        </div>}
        <div className="flex justify-between items-center w-full">
          <div className="flex space-x-2">
            <Link
              className="font-semibold text-sm cursor-pointer"
              to={`/profile/${post?.creator?.userName}`}
            >
              <ImageCircle
                src={post?.creator?.avatarUrl}
                userName={post?.creator?.userName}
              />
            </Link>
            <div className="flex flex-col justify-evenly">
              <Link
                className="font-semibold text-sm cursor-pointer hover:underline"
                to={`/profile/${post?.creator?.userName}`}
              >
                {post?.creator?.fullName}
              </Link>
              <Link
                className="text-xs text-gray-500 dark:text-dark-txt hover:underline space-x-2"
                to={`/posts/${post?.id}`}
              >
                <span>{formatDate(post?.dateCreated)}</span>
                <i className={PrivacyIcon[post?.privacy]}></i>
              </Link>
            </div>
          </div>
          <div className="relative" style={{zIndex: 6}} ref={ref}>
            <ClickableIcon
              iconClass="bx bx-dots-horizontal-rounded"
              secondMode
              onClick={() => setIsOpenMenu(!isOpenMenu)}
            />
            {isOpenMenu && (
              <div className="animate-fadeIn transition-base absolute top-5 right-0 border border-gray-200 bg-white w-48 rounded-lg shadow-lg overflow-hidden p-1 dark:bg-dark-secondary dark:border-dark-hover mt-2 select-none z-10">
                {post?.creator?.userName === currentUser?.userName &&
                  <>
                    <button
                      className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                      onClick={() => setIsOpenEdit(true)}
                    >
                      <i className="bx bx-edit-alt text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7"></i>
                      <span className="text-sm">Edit post</span>
                    </button>
                    <button
                      className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                      onClick={() => setIsOpenConfirm(true)}
                    >
                      <i className="bx bx-trash text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7"></i>
                      <span className="text-sm">Delete post</span>
                    </button>
                  </>}
                {post?.creator?.userName !== currentUser?.userName &&
                  <>
                    <button
                      className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-third"
                      onClick={() => setIsOpenReportModal(true)}
                    >
                      <i className="bx bx-error-alt text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7"></i>
                      <span className="text-sm">Report post</span>
                    </button>
                  </>}
              </div>
            )}
          </div>
        </div>
        <span className="text-sm break-words overflow-ellipsis max-w-full">
          {post?.content}
        </span>

        {post?.photos?.length > 0 && (
          <div className="w-full max-h-500 cursor-pointer">
            <PhotoList photos={post?.photos} />{" "}
          </div>
        )}

        <div className="flex justify-between w-full text-xs text-gray-500 pt-2">
          <div className="cursor-pointer flex items-center space-x-1">
            <div className="flex items-center">
              {topThreeType &&
                topThreeType.map((type, index) => (
                  <div
                    key={type}
                    className={
                      "w-5 h-5 " +
                      (index === 0 ? "z-3" : index === 1 ? "z-2" : "z-1")
                    }
                  >
                    <img
                      src={ReactionIcon[type]}
                      alt={ReactionName[type]}
                      className={
                        "w-full h-full border-2 border-white dark:border-dark-secondary rounded-full" +
                        " " +
                        (index === 1
                          ? "transform -translate-x-1"
                          : index === 2
                            ? "transform -translate-x-2"
                            : "")
                      }
                    />
                  </div>
                ))}
            </div>
            <span className="cursor-pointer text-gray-500 dark:text-dark-txt hover:underline">
              {post?.reactions?.length > 0 && post?.reactions?.length}
            </span>
          </div>
          <span
            className="cursor-pointer text-gray-500 dark:text-dark-txt hover:underline"
            onClick={() => setIsOpenCommentList((preState) => !preState)}
          >
            {post?.comments?.length > 0 &&
              post?.comments?.length +
              " comment" +
              (post?.comments?.length > 1 ? "s" : "")}
          </span>
        </div>
        <div className="w-full text-center flex justify-between items-center select-none cursor-pointer border-t border-b dark:border-dark-third space-x-1 text-gray-600 dark:text-dark-txt font-semibold text-sm p-1">
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
                  className="w-full h-full p-1 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded transition-base"
                  onClick={deleteReaction}
                >
                  <div className="flex-center space-x-2">
                    <img
                      src={ReactionIcon[reacted.type]}
                      alt={ReactionName[reacted.type]}
                      className="animate-popup md:w-5 md:h-5 h-4 w-4"
                    />
                    <span className={ReactionColor[reacted.type]}>
                      {ReactionName[reacted.type]}
                    </span>
                  </div>
                </div>
              </>
            ) : (
              <div
                className="w-full h-full p-1 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded transition-base"
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
            className="flex-1 p-1 h-full w-full bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded transition-base flex items-center justify-center"
            onClick={() => setIsOpenCommentList((preState) => !preState)}
          >
            <i className="bx bx-comment mr-2 text-lg align-middle "></i>
            Comment
          </span>
        </div>
        {isOpenCommentList && (
          <CommentInput postId={post?.id} currentUser={currentUser} />
        )}
        <CommentList
          postId={post?.id}
          comments={post?.comments}
          isOpen={isOpenCommentList}
          currentUser={currentUser}
        />
      </div>
    </>
  );
}

export default React.memo(Post);
