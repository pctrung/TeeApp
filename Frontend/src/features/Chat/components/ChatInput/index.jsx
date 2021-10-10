import EmojiIcon from "assets/icons/emoji-icon.svg";
import ImageIcon from "assets/icons/image-icon.svg";
import SendIconNormal from "assets/icons/send-icon.svg";
import ClickableIcon from "components/ClickableIcon";
import Picker from "emoji-picker-react";
import useChatApi from "hooks/api/useChatApi";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import PropTypes from "prop-types";
import React, { useRef, useState } from "react";

ChatInput.propTypes = {
  chatId: PropTypes.number,
};

function ChatInput({ chatId }) {
  const [content, setContent] = useState("");
  const [isOpenEmoji, setIsOpenEmoji] = useState(false);
  const ref = useRef();

  const chatApi = useChatApi();
  useCloseOnClickOutside(isOpenEmoji, setIsOpenEmoji, ref);

  async function onSendMessage(e) {
    e.preventDefault();
    if (!content) {
      return;
    }
    setContent("");

    var request = { content };
    await chatApi.sendMessage(chatId, request);
  }

  const onEmojiClick = (event, emojiObject) => {
    if (emojiObject?.emoji) {
      setContent(content + emojiObject?.emoji);
    }
  };

  async function sendImage(e) {
    var file = e.target.files[0];
    const formData = new FormData();
    formData.append("Image", file);

    await chatApi.sendImage(chatId, formData);
  }
  return (
    <div>
      <form
        onSubmit={(e) => onSendMessage(e)}
        className="flex justify-between items-center space-x-1"
      >
        <div className="relative w-full flex">
          <input
            id="imageFile"
            type="file"
            hidden
            accept="image/png, image/jpg, image/tiff, image/tif, image/jpeg"
            onChange={sendImage}
          />
          <label htmlFor="imageFile">
            <ClickableIcon
              secondMode
              className="h-9 w-9 p-2 mr-2"
              icon={ImageIcon}
            />
          </label>
          <input
            value={content}
            onChange={(e) => setContent(e.target.value)}
            type="text"
            placeholder="Aa"
            className="bg-gray-200 dark:bg-dark-third rounded-3xl w-full py-1 px-4 pr-12 focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 outline-none transition-base relative text-sm"
          />
          <div ref={ref} className="relative">
            <ClickableIcon
              secondMode
              className="absolute h-9 w-9 p-2 right-1 top-0"
              icon={EmojiIcon}
              onClick={() => setIsOpenEmoji(!isOpenEmoji)}
            />
            <div
              className={
                "animate-fadeIn absolute right-0 bottom-full " +
                " " +
                (isOpenEmoji ? "visible" : "invisible")
              }
            >
              <Picker onEmojiClick={onEmojiClick} />
            </div>
          </div>
        </div>

        <button>
          <ClickableIcon
            disableAutoFocus
            secondMode
            icon={SendIconNormal}
            className="w-9 h-9 p-2"
          />
        </button>
      </form>
    </div>
  );
}

export default ChatInput;
