import ClickableIcon from "components/ClickableIcon";
import ConfirmModal from "components/ConfirmModal";
import ImageCircle from "components/ImageCircle";
import usePostApi from "hooks/api/usePostApi";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import { useEscToClose } from "hooks/utils/useEscToClose";
import React, { useEffect, useRef, useState } from "react";
import { Link } from "react-router-dom";
import { formatDate } from "utils/UtilityMethods";

export default function CommentList({
  comments = [],
  isOpen,
  currentUser = {},
  postId,
}) {
  const myCommentList = [...comments]
    .filter((x) => x.creator?.userName === currentUser.userName)
    .sort((a, b) => (a.dateCreated < b.dateCreated ? 1 : -1));

  const otherCommentList = [...comments]
    .filter((x) => x.creator?.userName !== currentUser.userName)
    .sort((a, b) => (a.dateCreated < b.dateCreated ? 1 : -1));

  return (
    <>
      {myCommentList.map((comment, index) => (
        <Comment
          key={comment.id}
          comment={comment}
          postId={postId}
          isMyComment
        />
      ))}
      {isOpen &&
        otherCommentList.map((comment, index) => (
          <Comment key={comment.id} comment={comment} postId={postId} />
        ))}
    </>
  );
}

const Comment = React.memo(({ comment, postId, isMyComment }) => {
  const postApi = usePostApi();
  const [isOpenMenu, setIsOpenMenu] = useState(false);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);

  const [isEditMode, setIsEditMode] = useState(false);
  const [editContent, setEditContent] = useState(comment.content);

  const ref = useRef();
  const editInputRef = useRef();

  useCloseOnClickOutside(isOpenMenu, setIsOpenMenu, ref);
  useEscToClose(setIsEditMode);

  const deleteComment = () => {
    if (postId && comment?.id) {
      postApi.deleteComment(postId, comment.id);
    }
  };
  const onUpdateComment = (e) => {
    e.preventDefault();
    if (editContent !== comment.content) {
      postApi.updateComment(postId, comment.id, { content: editContent });
    }
    setIsEditMode(false);
  };

  useEffect(() => {
    if (isEditMode) {
      editInputRef?.current?.focus();
    }
  }, [isEditMode]);

  return (
    <>
      {isOpenConfirm && (
        <ConfirmModal
          isOpen={isOpenConfirm}
          closeAction={() => setIsOpenConfirm(false)}
          title="Are you sure?"
          content="Do you want to delete this comment?"
          confirmButtonTitle="Yes"
          confirmButtonAction={() => deleteComment()}
        />
      )}
      <div className={"flex space-x-2 max-w-full " + (isEditMode && "w-full")}>
        <Link
          className="font-semibold text-sm cursor-pointer flex-shrink-0 mt-2"
          to={`/profile/${comment?.creator?.userName}`}
        >
          <ImageCircle
            size="sm"
            src={comment?.creator?.avatarUrl}
            userName={comment?.creator?.userName}
          />
        </Link>
        <div className="flex flex-col w-full">
          <div className="flex flex-col justify-evenly w-full bg-gray-100 dark:bg-dark-third rounded-2xl px-3 py-2">
            <div className="w-full flex justify-between items-center mr-9">
              <Link
                className="font-semibold text-xs md:text-sm cursor-pointer hover:underline"
                to={`/profile/${comment?.creator?.userName}`}
              >
                {comment?.creator?.fullName}
              </Link>
            </div>
            {isEditMode ? (
              <form onSubmit={onUpdateComment} className="flex flex-col">
                <input
                  type="text"
                  placeholder="Write a comment"
                  ref={editInputRef}
                  className="bg-gray-100 dark:bg-dark-third outline-none "
                  onChange={(e) => setEditContent(e.target.value)}
                  value={editContent}
                />
                <span
                  className="text-xs self-end"
                  onClick={() => setIsEditMode(false)}
                >
                  Press Esc to{" "}
                  <span className="font-semibold text-green-500 cursor-pointer">
                    Cancel
                  </span>
                </span>
              </form>
            ) : (
              <div className="break-words overflow-x-auto text-xs md:text-sm max-w-350 md:max-w-450">
                {comment?.content}
              </div>
            )}
          </div>
          <span className="ml-2 text-tiny md:text-xs text-gray-500 dark:text-dark-txt">
            {formatDate(comment?.dateCreated)}
          </span>
        </div>
        <div ref={ref} className="relative self-center mb-5">
          {isMyComment && (
            <>
              <ClickableIcon
                iconClass="bx bx-dots-horizontal-rounded"
                secondMode
                onClick={() => {
                  setIsOpenMenu(!isOpenMenu);
                }}
              />
              {isOpenMenu && (
                <div className="animate-fadeIn transition-base absolute top-5 p-1 w-48 right-3 border border-gray-200 bg-white rounded-lg shadow-lg overflow-hidden dark:bg-dark-secondary dark:border-dark-hover mt-2 select-none z-10">
                  <button
                    className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-hover text-sm"
                    onClick={() => {
                      setIsEditMode(true);
                      setIsOpenMenu(false);
                    }}
                  >
                    <i className="bx bx-edit-alt text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 mr-2"></i>
                    <span className="text-sm">Edit comment</span>
                  </button>
                  <button
                    className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-hover text-sm"
                    onClick={() => {
                      setIsOpenConfirm(true);
                      setIsOpenMenu(false);
                    }}
                  >
                    <i className="bx bx-trash text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 mr-2"></i>
                    <span className="text-sm">Delete comment</span>
                  </button>
                </div>
              )}
            </>
          )}
        </div>
      </div>
    </>
  );
});
