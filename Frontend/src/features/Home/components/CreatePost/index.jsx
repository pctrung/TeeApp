import ImageIcon from "assets/icons/image-icon.svg";
import Button from "components/Button";
import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import Popup from "components/Popup";
import EmojiPicker from "emoji-picker-react";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import { useDisableBodyScroll } from "hooks/utils/useDisableBodyScroll";
import { useEscToClose } from "hooks/utils/useEscToClose";
import usePostApi from "hooks/api/usePostApi";
import React, { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { ACCEPTED_FILE_TYPES as ACCEPTED_IMAGE_TYPES, MAX_IMAGE_SIZE, MAX_IMAGE_SIZE_NUMBER } from "utils/Constants";
import { PrivacyIcon, PrivacyName, PrivacyType } from "utils/Enums";
import { addPost } from "app/postSlice";

function CreatePost() {
  const currentUser = useSelector((state) => state.users.currentUser);

  const [content, setContent] = useState("");
  const [privacy, setPrivacy] = useState(PrivacyType.PUBLIC);
  const [imageFiles, setImageFiles] = useState([]);

  const [popup, setPopup] = useState({});
  const [isOpenPrivacyList, setIsOpenPrivacyList] = useState(false);
  const [isValidButton, setIsValidButton] = useState(false);
  const [isOpen, setIsOpen] = useState(false);
  const [isOpenEmoji, setIsOpenEmoji] = useState(false);

  const ref = useRef();
  const emojiRef = useRef();
  const privacyRef = useRef();
  const postApi = usePostApi();
  const dispatch = useDispatch();

  useDisableBodyScroll(isOpen);

  // Check click outside emoji
  useCloseOnClickOutside(isOpenEmoji, setIsOpenEmoji, emojiRef);
  // Check click outside create post
  useCloseOnClickOutside(isOpen, setIsOpen, ref);
  // Check click outside privacy
  useCloseOnClickOutside(isOpenPrivacyList, setIsOpenPrivacyList, privacyRef);

  // Check click esc to close
  useEscToClose(setIsOpen);

  const onEmojiClick = (event, emojiObject) => {
    if (emojiObject?.emoji) {
      setContent(content + emojiObject?.emoji);
    }
  };

  function addFiles(files) {
    var isValid = true;
    const newImageFiles = [...imageFiles, ...files];
    if (newImageFiles.length > 10) {
      setPopup({
        content: "Please select maximum 10 images!",
        isOpen: true,
      });
      isValid = false;
    }
    newImageFiles.forEach((file) => {
      if (file.size > MAX_IMAGE_SIZE) {
        setPopup({
          content: `Please upload less than ${MAX_IMAGE_SIZE_NUMBER}MB for each file!`,
          isOpen: true,
        });
        isValid = false;
      }
    });
    if (isValid) {
      setImageFiles(newImageFiles);
    }
  }
  function removeImage(index) {
    if (index >= 0 && index < imageFiles.length) {
      const newImageFiles = [...imageFiles];
      newImageFiles.splice(index, 1);
      setImageFiles(newImageFiles);
    }
  }
  useEffect(() => {
    if (content.trim() || imageFiles.length > 0) {
      setIsValidButton(true);
    } else {
      setIsValidButton(false);
    }
  }, [content, imageFiles]);

  function onSubmit(e) {
    e.preventDefault();
    postApi.addPost({ content, privacy }).then((response) => {
      if (response.id) {
        imageFiles.forEach((image) => {
          const request = new FormData();
          request.append("Image", image);
          request.append("Caption", "Post photo");
          postApi.addPhoto(response.id, request);
        });
      }
      postApi.getById(response.id).then((response) => {
        dispatch(addPost(response));
      });
    });

    setIsOpen(false);
    setContent("");
    setImageFiles([]);
  }
  return (
    <>
      <div className="max-w-xl md:min-w-500 min-w-200 w-full bg-white dark:bg-dark-secondary rounded-xl shadow px-4 pt-3 pb-1 space-y-3 divide-y">
        <div className="flex space-x-2 w-full items-center">
          <Link
            className="font-semibold text-sm cursor-pointer flex-shrink-0"
            to={`/profile/${currentUser?.userName}`}
          >
            <ImageCircle src={currentUser?.avatarUrl} />
          </Link>
          <div onClick={() => setIsOpen(true)} className="w-full">
            <input
              disabled
              type="text"
              placeholder={`What's on your mind${currentUser.firstName ? ", " + currentUser.firstName : ""
                }?`}
              className="bg-gray-100 dark:bg-dark-third rounded-3xl w-full py-2 px-4 pr-12 focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 outline-none transition-all duration-200 relative placeholder-gray-500 dark:placeholder-dark-txt hover:bg-gray-200 dark:hover:bg-dark-hover cursor-pointer text-sm md:text-base"
            />
          </div>
        </div>
        <div className="w-full text-center flex justify-between select-none cursor-pointer py-1 border-t border-b dark:border-dark-third space-x-1 text-gray-600 dark:text-dark-txt font-semibold">
          <span
            className="flex-1 p-1 md:py-2 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base flex items-center justify-center space-x-2 text-sm md:text-base"
            onClick={() => setIsOpen(true)}
          >
            <img src={ImageIcon} alt="icon" className="md:w-6 md:h-6 w-4 h-4" />
            <span>Your Photos</span>
          </span>
          <span
            className="flex-1 p-1 md:py-2 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base text-sm md:text-base"
            onClick={() => setIsOpen(true)}
          >
            <i className="far fa-smile-beam mr-2 md:text-xl align-middle text-green-500 dark:text-green-400"></i>
            Your Feeling
          </span>
        </div>
      </div>
      {isOpen && (
        <div
          className="overlay px-4 py-10 z-30 grid place-items-center"
          style={{ margin: 0 }}
        >
          <div
            className="flex-center flex-col bg-white dark:bg-dark-secondary dark:border-dark-third rounded-xl shadow-xl border border-gray-300 w-full md:w-5/6 lg:w-2/5 transition-all duration-300 ease-in-out max-h-full animate-swipeDown overflow-x-auto "
            ref={ref}
          >
            {popup.isOpen && (
              <Popup
                title="Notification"
                isOpen={popup.isOpen}
                content={popup.content}
                onClick={() => setPopup({ isOpen: false })}
              />
            )}
            <div className="relative font-bold text-center text-lg md:text-xl py-4 border-b dark:border-gray-600 w-full">
              Create post
              <ClickableIcon
                onClick={() => setIsOpen(false)}
                iconClass="bx bx-x"
                className="absolute bg-white right-3 top-3 animate-swipeUp"
              />
            </div>
            <form
              onSubmit={onSubmit}
              className="flex flex-col items-start w-full px-6 space-y-4 py-4"
            >
              <div className="flex space-x-2">
                <Link
                  className="font-semibold text-sm cursor-pointer"
                  to={`/profile/${currentUser.userName}`}
                >
                  <ImageCircle
                    src={currentUser.avatarUrl}
                    userName={currentUser.userName}
                  />
                </Link>
                <div className="flex flex-col justify-between space-y-1">
                  <Link
                    className="font-semibold text-sm cursor-pointer hover:underline"
                    to={`/profile/${currentUser.userName}`}
                  >
                    {currentUser.fullName}
                  </Link>
                  <div className="relative select-none">
                    <div
                      className="p-1 px-2 w-24 flex justify-between items-center text-xs bg-gray-200 dark:bg-dark-hover rounded cursor-pointer "
                      onClick={() => setIsOpenPrivacyList(true)}
                    >
                      <div className="flex items-center space-x-2">
                        <i className={PrivacyIcon[privacy]}></i>
                        <span>{PrivacyName[privacy]}</span>
                      </div>
                      <i className="bx bx-caret-down ml-1"></i>
                    </div>
                    {isOpenPrivacyList && (
                      <div
                        className="animate-fadeIn absolute w-28 top-full left-0 bg-gray-100 dark:bg-dark-third rounded p-1 text-sm"
                        ref={privacyRef}
                      >
                        {Object.values(PrivacyType).map((privacy) => (
                          <div
                            onClick={() => {
                              setPrivacy(privacy);
                              setIsOpenPrivacyList(false);
                            }}
                            className="cursor-pointer hover:bg-gray-200 flex items-center dark:hover:bg-dark-hover p-1 px-2 rounded duration-150 w-full space-x-2"
                          >
                            <i className={PrivacyIcon[privacy]}></i>
                            <span>{PrivacyName[privacy]}</span>
                          </div>
                        ))}
                      </div>
                    )}
                  </div>
                </div>
              </div>
              <textarea
                value={content}
                onChange={(e) => setContent(e.target.value)}
                rows="3"
                className="w-full text-lg md:text-2xl placeholder-gray-500 dark:placeholder-dark-txt focus:placeholder-gray-300 dark:focus:placeholder-dark-hover outline-none transition-base bg-white dark:bg-dark-secondary resize-none"
                placeholder={`What's on your mind${currentUser.firstName ? ", " + currentUser.firstName : ""
                  }?`}
              ></textarea>
              <div ref={emojiRef} className="relative w-full flex justify-end">
                <ClickableIcon
                  secondMode
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
              <div className="w-full max-w-xs md:max-w-max overflow-x-auto flex space-x-2 select-none pb-2">
                <input
                  hidden
                  id="imageFiles"
                  type="file"
                  multiple
                  onChange={(e) => addFiles(e.target.files)}
                  accept={ACCEPTED_IMAGE_TYPES}
                />
                <label
                  htmlFor="imageFiles"
                  className="cursor-pointer h-24 w-20 md:h-28 md:w-28 bg-gray-100 hover:bg-gray-200 active:bg-gray-300 dark:bg-dark-third dark:hover:bg-dark-hover dark:active:bg-gray-700 rounded-xl flex-center transition-base flex-shrink-0"
                >
                  <i className="bx bxs-image-add text-4xl"></i>
                </label>
                {imageFiles.length > 0 &&
                  imageFiles.map((imageFile, index) => (
                    <div
                      key={"imageFiles" + index}
                      className="relative cursor-pointer h-24 w-20 md:h-28 md:w-28 bg-gray-100 dark:bg-dark-third rounded-xl flex-center transition-base overflow-hidden flex-shrink-0 "
                    >
                      {imageFile?.type?.match('video.*')
                        ? <video src={URL.createObjectURL(imageFile)}></video>
                        : <img src={URL.createObjectURL(imageFile)} alt="Preview" />}
                      <ClickableIcon
                        onClick={() => removeImage(index)}
                        iconClass="bx bx-x"
                        reverse
                        className="absolute right-1 top-1 animate-swipeUp w-6 h-6 object-cover"
                      />
                    </div>
                  ))}
              </div>
              <Button
                disabled={!isValidButton}
                className="w-full font-semibold"
              >
                Post
              </Button>
            </form>
          </div>
        </div>
      )}
    </>
  );
}

export default CreatePost;
