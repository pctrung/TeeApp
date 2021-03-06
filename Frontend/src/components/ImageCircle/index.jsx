import DefaultAvatar from "assets/img/default-avatar.jpg";
import PropTypes from "prop-types";
import React from "react";
import { useSelector } from "react-redux";

ImageCircle.propTypes = {
  src: PropTypes.string,
  className: PropTypes.string,
  alt: PropTypes.string,
  size: PropTypes.string,
};

function ImageCircle({
  src = DefaultAvatar,
  className = "",
  parentClassName = "",
  alt = "Avatar",
  size = "md",
  userName = "",
  participants,
  onClick,
}) {
  const onlineUserNameList = useSelector(
    (state) => state.users.onlineUserNameList,
  );
  const currentUser = useSelector((state) => state.users.currentUser);

  const isCurrentUser = userName === currentUser.userName;

  var isOnline = false;
  if (!isCurrentUser) {
    if (userName) {
      isOnline = onlineUserNameList.includes(userName);
    } else if (participants) {
      isOnline = participants
        .filter((x) => x.userName !== currentUser.userName)
        .map((x) => x)
        .some((x) => onlineUserNameList.includes(x.userName));
    }
  }

  var onlineSize;
  switch (size) {
    case "xs":
      onlineSize = "w-2 h-2";
      break;
    case "sm":
      onlineSize = "md:w-3 md:h-3 w-2 h-2 md:border-2 border";
      break;
    case "lg":
      onlineSize = "border-2 w-4 h-4";
      break;
    case "xl":
      onlineSize = "border-2 w-5 h-5";
      break;
    case "full":
      onlineSize = "border-4 w-1/5 h-1/5";
      break;
    default:
      onlineSize = "border-2 md:w-4 md:h-4 h-3 w-3";
  }

  var avatarSize;
  switch (size) {
    case "xs":
      avatarSize = "h-5 w-5 md:h-6 md:w-6";
      break;
    case "sm":
      avatarSize = "h-6 w-6 md:h-8 md:w-8";
      break;
    case "lg":
      avatarSize = "h-14 w-14 md:h-16 md:w-16";
      break;
    case "xl":
      avatarSize = "h-20 w-20 md:h-24 md:w-24";
      break;
    case "full":
      avatarSize = "h-full w-full";
      break;
    default:
      avatarSize = "h-10 w-10 md:h-12 md:w-12";
  }
  return (
    <div className={`relative flex-shrink-0 ${parentClassName}`}>
      <img
        onClick={onClick}
        className={
          avatarSize +
            " " +
            "select-none bg-white rounded-full object-cover flex-shrink-0" +
            " " +
            className ?? ""
        }
        src={!src || src === "" ? DefaultAvatar : src}
        alt={alt}
      />
      {(isCurrentUser || isOnline) && (
        <span
          className={
            "absolute bg-green-500 dark:bg-green-400 bottom-0 right-0 rounded-full border-white dark:border-black" +
            " " +
            onlineSize
          }
        ></span>
      )}
    </div>
  );
}

export default React.memo(ImageCircle);
