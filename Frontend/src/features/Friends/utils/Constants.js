export const FriendOptionType = {
  FRIENDS: 1,
  FRIEND_REQUESTS: 2,
  BIRTHDAYS: 3,
  FOLLOWING: 4,
  FOLLOWERS: 5,
  BLOCKED: 6,
};

export const FriendOption = [
  {
    name: "Friends",
    type: FriendOptionType.FRIENDS,
  },
  {
    name: "Friend Requests",
    type: FriendOptionType.FRIEND_REQUESTS,
  },
  {
    name: "Following",
    type: FriendOptionType.FOLLOWING,
  },
  {
    name: "Followers",
    type: FriendOptionType.FOLLOWERS,
  },
  {
    name: "Blocked",
    type: FriendOptionType.BLOCKED,
  },
];
