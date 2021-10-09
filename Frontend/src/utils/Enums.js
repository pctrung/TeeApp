import AngryIcon from "assets/icons/reactions/angry.svg";
import CareIcon from "assets/icons/reactions/care.svg";
import HahaIcon from "assets/icons/reactions/haha.svg";
import LikeIcon from "assets/icons/reactions/like.svg";
import LoveIcon from "assets/icons/reactions/love.svg";
import SadIcon from "assets/icons/reactions/sad.svg";
import WowIcon from "assets/icons/reactions/wow.svg";

export const ChatType = {
  PRIVATE: 1,
  GROUP: 2,
};
export const FriendshipType = {
  PENDING: 0,
  ACCEPTED: 1,
};
export const RelationType = {
  FRIEND_REQUEST_TO_ME: 0,
  FRIEND: 1,
  FRIEND_REQUEST_BY_ME: 2,
  NOT_FRIEND: 3,
};
export const Gender = {
  MALE: 0,
  FEMALE: 1,
  OTHER: 2,
};
export const GenderName = {
  [Gender.MALE]: "Male",
  [Gender.FEMALE]: "Female",
  [Gender.OTHER]: "Other",
};

export const NotificationType = {
  COMMENT: 0,
  REACTION: 1,
  FRIEND_REQUEST: 2,
  ACCEPTED_FRIEND_REQUEST: 3,
  FOLLOW: 4,
};

export const PrivacyType = {
  PUBLIC: 0,
  FRIEND: 2,
  PRIVATE: 1,
};
export const PrivacyName = {
  [PrivacyType.PUBLIC]: "Public",
  [PrivacyType.FRIEND]: "Friend",
  [PrivacyType.PRIVATE]: "Private",
};
export const PrivacyIcon = {
  [PrivacyType.PUBLIC]: "fas fa-globe-asia",
  [PrivacyType.FRIEND]: "fas fa-user-friends",
  [PrivacyType.PRIVATE]: "bx bxs-lock-alt",
};
export const ReactionType = {
  LIKE: 0,
  LOVE: 1,
  CARE: 2,
  HAHA: 4,
  WOW: 3,
  SAD: 5,
  ANGRY: 6,
};
export const ReactionName = {
  [ReactionType.LIKE]: "Like",
  [ReactionType.LOVE]: "Love",
  [ReactionType.CARE]: "Care",
  [ReactionType.HAHA]: "Haha",
  [ReactionType.WOW]: "Wow",
  [ReactionType.SAD]: "Sad",
  [ReactionType.ANGRY]: "Angry",
};
export const ReactionIcon = {
  [ReactionType.LIKE]: LikeIcon,
  [ReactionType.LOVE]: LoveIcon,
  [ReactionType.CARE]: CareIcon,
  [ReactionType.HAHA]: HahaIcon,
  [ReactionType.WOW]: WowIcon,
  [ReactionType.SAD]: SadIcon,
  [ReactionType.ANGRY]: AngryIcon,
};
export const ReactionColor = {
  [ReactionType.LIKE]: "text-blue-600 dark:text-blue-400 ",
  [ReactionType.LOVE]: "text-pink-600",
  [ReactionType.HAHA]: "text-yellow-500",
  [ReactionType.CARE]: "text-yellow-500",
  [ReactionType.WOW]: "text-yellow-500",
  [ReactionType.SAD]: "text-yellow-500",
  [ReactionType.ANGRY]: "text-yellow-600",
};
