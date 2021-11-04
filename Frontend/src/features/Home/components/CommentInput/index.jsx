import SendIconNormal from "assets/icons/send-icon.svg";
import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import EmojiPicker from "emoji-picker-react";
import usePostApi from "hooks/api/usePostApi";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import React, { useRef, useState } from "react";
import { Link } from "react-router-dom";

function CommentInput({ postId, currentUser = {} }) {
  const [content, setContent] = useState("");
  const [isOpenEmoji, setIsOpenEmoji] = useState(false);

  const ref = useRef();

  const postApi = usePostApi();

  useCloseOnClickOutside(isOpenEmoji, setIsOpenEmoji, ref);

  async function onSendMessage(e) {
    e.preventDefault();
    if (!content) {
      return;
    }
    setContent("");
    var request = { content };
    await postApi.addComment(postId, request);
  }

  const onEmojiClick = (event, emojiObject) => {
    if (emojiObject?.emoji) {
      setContent(content + emojiObject?.emoji);
    }
  };
  return (
    <div className="flex space-x-2 w-full items-center">
      <Link
        className="font-semibold text-sm cursor-pointer flex-shrink-0"
        to={`/profile/${currentUser?.userName}`}
      >
        <ImageCircle size="sm" src={currentUser?.avatarUrl} />
      </Link>
      <form
        onSubmit={(e) => onSendMessage(e)}
        className="flex justify-between items-center space-x-1 z-0 w-full"
      >
        <div className="relative w-full flex">
          <input
            value={content}
            onChange={(e) => setContent(e.target.value)}
            type="text"
            placeholder="Write a comment"
            className="bg-gray-100 dark:bg-dark-third rounded-3xl w-full py-2 px-4 pr-12 focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 outline-none transition-all duration-200 relative"
          />
          <div ref={ref} className="relative">
            <ClickableIcon
              className="absolute h-10 w-10 right-1"
              iconClass="bx bxs-smile"
              colorIconClass="text-green-500"
              onClick={() => setIsOpenEmoji(!isOpenEmoji)}
            />
            {isOpenEmoji && (
              <div className="animate-fadeIn absolute right-0 bottom-full">
                <EmojiPicker disableAutoFocus onEmojiClick={onEmojiClick} />
              </div>
            )}
          </div>
        </div>
        <button>
          <ClickableIcon
            icon={SendIconNormal}
            className="w-10 h-10 p-2"
            colorClass="bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary hover:dark:bg-dark-third active:dark:bg-dark-hover"
          />
        </button>
      </form>
    </div>
  );
}

export default CommentInput;
