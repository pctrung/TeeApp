import ImageCircle from "components/ImageCircle";
import ImageIcon from "assets/icons/image-icon.svg";
import React, { useEffect, useRef, useState } from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";
import ClickableIcon from "components/ClickableIcon";
import EmojiPicker from "emoji-picker-react";
import Button from "components/Button";
import usePostApi from "hooks/usePostApi";
import { PrivacyIcon, PrivacyName, PrivacyType } from "utils/Enums";
import Popup from "components/Popup";
import { MAX_IMAGE_SIZE } from "utils/Constants";

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

  // Check click outside emoji
  useEffect(() => {
    const checkIfClickedOutside = (e) => {
      if (
        isOpenEmoji &&
        emojiRef.current &&
        !emojiRef.current.contains(e.target)
      ) {
        setIsOpenEmoji(false);
      }
    };
    document.addEventListener("mousedown", checkIfClickedOutside);
    return () => {
      document.removeEventListener("mousedown", checkIfClickedOutside);
    };
  }, [isOpenEmoji]);
  const onEmojiClick = (event, emojiObject) => {
    if (emojiObject?.emoji) {
      setContent(content + emojiObject?.emoji);
    }
  };
  // Check click outside create post
  useEffect(() => {
    const checkIfClickedOutside = (e) => {
      if (isOpen && ref.current && !ref.current.contains(e.target)) {
        setIsOpen(false);
      }
    };
    document.addEventListener("mousedown", checkIfClickedOutside);
    return () => {
      document.removeEventListener("mousedown", checkIfClickedOutside);
    };
  }, [isOpen]);
  // Check click outside privacy
  useEffect(() => {
    const checkIfClickedOutside = (e) => {
      if (
        isOpenPrivacyList &&
        privacyRef.current &&
        !privacyRef.current.contains(e.target)
      ) {
        setIsOpenPrivacyList(false);
      }
    };
    document.addEventListener("mousedown", checkIfClickedOutside);
    return () => {
      document.removeEventListener("mousedown", checkIfClickedOutside);
    };
  }, [isOpenPrivacyList]);

  // Esc to cancel view
  function escFunction(e) {
    if (e.keyCode === 27) {
      setIsOpen(false);
    }
  }
  useEffect(() => {
    document.addEventListener("keydown", escFunction, false);
    return () => {
      document.removeEventListener("keydown", escFunction, false);
    };
  }, []);

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
          content: "Please upload less than 1MB per file!",
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
    });
    setIsOpen(false);
    setContent("");
    setImageFiles([]);
  }
  return (
    <>
      <div className="bg-white dark:bg-dark-secondary border dark:border-dark-hover w-full rounded-xl shadow px-4 pt-3 pb-1 space-y-3 divide-y">
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
              placeholder={`What's on your mind${
                currentUser.firstName ? ", " + currentUser.firstName : ""
              }?`}
              className="bg-gray-100 dark:bg-dark-third rounded-3xl w-full py-2 px-4 pr-12 focus:ring-2 focus:ring-green-500 focus:ring-opacity-50 outline-none transition-all duration-200 relative placeholder-gray-500 dark:placeholder-dark-txt hover:bg-gray-200 dark:hover:bg-dark-hover cursor-pointer "
            />
          </div>
        </div>
        <div className="w-full text-center flex justify-between select-none cursor-pointer py-1 border-t border-b dark:border-dark-third space-x-1 text-gray-600 dark:text-dark-txt font-semibold">
          <span
            className="flex-1 p-1 py-2 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base flex items-center justify-center space-x-2"
            onClick={() => setIsOpen(true)}
          >
            <img src={ImageIcon} alt="Image icon" className="w-6 h-6" />
            <span>Your Photos</span>
          </span>
          <span
            className="flex-1 p-1 py-2 bg-white hover:bg-gray-100 active:bg-gray-200 dark:bg-dark-secondary dark:hover:bg-dark-third dark:active:bg-dark-hover rounded-lg transition-base "
            onClick={() => setIsOpen(true)}
          >
            <i className="far fa-smile-beam mr-2 text-xl align-middle text-green-500 dark:text-green-400"></i>
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
            className="flex-center flex-col bg-white dark:bg-dark-secondary dark:border-dark-third rounded-xl shadow-xl border border-gray-300 w-full md:w-5/6 lg:w-2/5 transition-all duration-300 ease-in-out max-h-full animate-swipeDown overflow-x-auto"
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
                className="absolute bg-white md:right-10 right-8 top-3 animate-swipeUp"
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
                      className="p-1 px-2 text-xs bg-gray-200 dark:bg-dark-hover rounded space-x-2 cursor-pointer "
                      onClick={() => setIsOpenPrivacyList(true)}
                    >
                      <i className={PrivacyIcon[privacy]}></i>
                      <span>{PrivacyName[privacy]}</span>
                    </div>
                    {isOpenPrivacyList && (
                      <div
                        className="animate-fadeIn absolute w-28 top-full transform translate-y-1 -left-2 bg-gray-100 dark:bg-dark-third rounded p-1 text-sm"
                        ref={privacyRef}
                      >
                        {Object.values(PrivacyType).map((privacy) => (
                          <div
                            onClick={() => {
                              setPrivacy(privacy);
                              setIsOpenPrivacyList(false);
                            }}
                            className="cursor-pointer hover:bg-gray-200 dark:hover:bg-dark-hover p-1 px-2 rounded duration-150 w-full space-x-2"
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
                placeholder={`What's on your mind${
                  currentUser.firstName ? ", " + currentUser.firstName : ""
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
              <div className="w-full overflow-x-auto flex space-x-2 select-none pb-2">
                <input
                  hidden
                  id="imageFiles"
                  type="file"
                  multiple
                  onChange={(e) => addFiles(e.target.files)}
                />
                <label
                  htmlFor="imageFiles"
                  className="cursor-pointer h-28 w-28 bg-gray-100 hover:bg-gray-200 active:bg-gray-300 dark:bg-dark-third dark:hover:bg-dark-hover dark:active:bg-gray-700 rounded-xl flex-center transition-base flex-shrink-0"
                >
                  <i className="bx bxs-image-add text-4xl"></i>
                </label>
                {imageFiles.length > 0 &&
                  imageFiles.map((imageFile, index) => (
                    <div
                      key={"imageFiles" + index}
                      className="relative cursor-pointer h-28 w-28 bg-gray-100 dark:bg-dark-third rounded-xl flex-center transition-base overflow-hidden flex-shrink-0 "
                    >
                      <img src={URL.createObjectURL(imageFile)} alt="Preview" />
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
