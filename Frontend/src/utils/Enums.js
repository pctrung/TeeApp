import AngryIcon from "assets/icons/reactions/angry.svg";
import CareIcon from "assets/icons/reactions/care.svg";
import HahaIcon from "assets/icons/reactions/haha.svg";
import LikeIcon from "assets/icons/reactions/like.svg";
import LoveIcon from "assets/icons/reactions/love.svg";
import SadIcon from "assets/icons/reactions/sad.svg";
import WowIcon from "assets/icons/reactions/wow.svg";

const ChatType = {
  PRIVATE: 1,
  GROUP: 2,
};

const Gender = {
  MALE: 0,
  FEMALE: 1,
  OTHER: 2,
};

const NotificationType = {
  COMMENT: 0,
  REACTION: 1,
  FRIEND_REQUEST: 2,
  ACCEPTED_FRIEND_REQUEST: 3,
  FOLLOW: 4,
};

const ReactionType = {
  LIKE: 0,
  LOVE: 1,
  CARE: 2,
  WOW: 3,
  HAHA: 4,
  SAD: 5,
  ANGRY: 6,
};
const ReactionName = {
  [ReactionType.LIKE]: "Like",
  [ReactionType.LOVE]: "Love",
  [ReactionType.CARE]: "Care",
  [ReactionType.HAHA]: "Haha",
  [ReactionType.WOW]: "Wow",
  [ReactionType.SAD]: "Sad",
  [ReactionType.ANGRY]: "Angry",
};
const ReactionIcon = {
  [ReactionType.LIKE]: LikeIcon,
  [ReactionType.LOVE]: LoveIcon,
  [ReactionType.CARE]: CareIcon,
  [ReactionType.HAHA]: HahaIcon,
  [ReactionType.WOW]: WowIcon,
  [ReactionType.SAD]: SadIcon,
  [ReactionType.ANGRY]: AngryIcon,
};
const ReactionColor = {
  [ReactionType.LIKE]: "text-blue-600 dark:text-blue-400 ",
  [ReactionType.LOVE]: "text-pink-600",
  [ReactionType.HAHA]: "text-yellow-500",
  [ReactionType.CARE]: "text-yellow-500",
  [ReactionType.WOW]: "text-yellow-500",
  [ReactionType.SAD]: "text-yellow-500",
  [ReactionType.ANGRY]: "text-yellow-600",
};

export {
  ChatType,
  Gender,
  NotificationType,
  ReactionType,
  ReactionName,
  ReactionIcon,
  ReactionColor,
};
