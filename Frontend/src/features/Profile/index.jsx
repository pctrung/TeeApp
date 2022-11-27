import { setCurrentUser } from "app/userSlice";
import DefaultCover from "assets/img/default-cover.jpg";
import Button from "components/Button";
import ClickableIcon from "components/ClickableIcon";
import ImageCircle from "components/ImageCircle";
import ImageView from "components/ImageView";
import Pagination from "components/Pagination";
import CreatePost from "features/Home/components/CreatePost";
import Post from "features/Home/components/Post";
import useFriendApi from "hooks/api/useFriendApi";
import useUserApi from "hooks/api/useUserApi";
import usePostPagination from "hooks/pagination/usePostPagination";
import React, { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useParams } from "react-router-dom";
import { RelationType } from "utils/Enums";
import ChangePassword from "./components/ChangePassword";
import EditUser from "./components/EditUser";
import UserInfo from "./components/UserInfo";
import ConfirmModal from "components/ConfirmModal";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import { useHistory } from "react-router-dom";
import { addSelectedId } from "app/chatSlice";
import useChatApi from "hooks/api/useChatApi";
import { DefaultPagination } from "utils/Constants";

function Profile() {
  const { userName } = useParams();
  const userApi = useUserApi();
  const friendApi = useFriendApi();
  const chatApi = useChatApi();
  const [user, setUser] = useState({});
  const [isOpenChangePassword, setIsOpenChangePassword] = useState(false);
  const [isOpenEdit, setIsOpenEdit] = useState(false);
  const [isOpenMenu, setIsOpenMenu] = useState(false);
  const [confirmModal, setConfirmModal] = useState({});
  const [relation, setRelation] = useState({});
  const [relationButton, setRelationButton] = useState(<></>);
  const [photoView, setPhotoView] = useState({ isOpen: false });

  const history = useHistory();
  const dispatch = useDispatch();
  const currentUser = useSelector((state) => state.users.currentUser);
  const isCurrentUser = currentUser.userName === userName;

  const menuRef = useRef();
  useCloseOnClickOutside(isOpenMenu, setIsOpenMenu, menuRef);

  const [pagination, setPagination] = useState(DefaultPagination);
  const { posts, isHasMore, isLoading, error } = usePostPagination(
    pagination,
    userName,
  );

  async function handleCreateChat(userName) {
    const request = {
      participantUserName: userName,
    };
    chatApi.createPrivateChat(request).then((response) => {
      if (response.id) {
        dispatch(addSelectedId(response.id));
      }
    });
  }

  useEffect(() => {
    if (isCurrentUser) {
      setUser(currentUser);
    } else {
      if (userApi && userName) {
        userApi
          .getByUserName(userName)
          .then((response) => {
            setUser(response);
          })
          .catch(() => {
            history.push("/NotFound");
          });
      }
      if (friendApi && userName) {
        fetchRelation();
      }
    }
    setPagination({ page: 1 });
    window.scrollTo(0, 0);
  }, [userName, currentUser]);

  function openPhotoView(photos) {
    setPhotoView({ isOpen: true, photos });
  }
  function loadMore() {
    if (isHasMore) {
      setPagination({ page: pagination.page + 1 });
    }
  }
  async function updateCover(e) {
    var file = e.target.files[0];
    const formData = new FormData();
    formData.append("File", file);
    await userApi.updateCover(formData).then((response) => {
      dispatch(setCurrentUser(response));
    });
  }
  async function updateAvatar(e) {
    var file = e.target.files[0];
    const formData = new FormData();
    formData.append("File", file);
    await userApi.updateAvatar(formData).then((response) => {
      dispatch(setCurrentUser(response));
    });
  }
  function fetchRelation() {
    friendApi
      .getRelationByUserName(userName)
      .then((response) => {
        setRelation(response);
      })
      .catch(() => {
        history.push("/NotFound");
      });
  }
  function addFriend() {
    if (friendApi) {
      friendApi.addFriend(userName).then((response) => {
        fetchRelation();
      });
    }
  }
  function unfriend() {
    if (friendApi) {
      friendApi.unfriend(userName).then((response) => {
        setRelation({
          ...relation,
          relationType: RelationType.NOT_FRIEND,
          isFollowing: false,
        });
      });
    }
  }
  function accept() {
    if (friendApi) {
      friendApi.accept(userName).then((response) => {
        fetchRelation();
      });
    }
  }
  function follow() {
    if (friendApi) {
      friendApi.follow(userName).then((response) => {
        fetchRelation();
      });
    }
  }
  function unfollow() {
    if (friendApi) {
      friendApi.unfollow(userName).then((response) => {
        fetchRelation();
      });
    }
  }
  function block() {
    if (friendApi) {
      friendApi.block(userName).then((response) => {
        history.push("/friends");
      });
    }
  }
  function openBlockModal() {
    setConfirmModal({
      isOpen: true,
      content: `Do you want to block ${user.fullName ?? "this user"}?`,
      action: block,
    });
  }
  function openUnfriendModal() {
    setConfirmModal({
      isOpen: true,
      content: `Do you want to unfriend ${user.fullName ?? "this user"}?`,
      action: unfriend,
    });
  }
  function openDeclineModal() {
    setConfirmModal({
      isOpen: true,
      content: `Do you want to decline friend request from ${user.fullName ?? "this user"
        }?`,
      action: unfriend,
    });
  }
  useEffect(() => {
    if (relation) {
      switch (relation.relationType) {
        case RelationType.FRIEND: {
          setRelationButton(
            <Button
              className="relative flex items-center space-x-1"
              onClick={openUnfriendModal}
            >
              <i className="bx bxs-user-check text-xl"></i>
              <span>Friend</span>
            </Button>,
          );
          break;
        }
        case RelationType.NOT_FRIEND: {
          setRelationButton(
            <Button className="flex items-center space-x-1" onClick={addFriend}>
              <i className="bx bxs-user-plus text-xl"></i>
              <span>Add friend</span>
            </Button>,
          );
          break;
        }
        case RelationType.FRIEND_REQUEST_BY_ME: {
          setRelationButton(
            <Button className="flex items-center space-x-1" onClick={unfriend}>
              <i className="bx bxs-user-x text-xl"></i>
              <span>Cancel request</span>
            </Button>,
          );
          break;
        }
        case RelationType.FRIEND_REQUEST_TO_ME: {
          setRelationButton(
            <>
              <Button
                secondary
                className="flex items-center space-x-1"
                onClick={openDeclineModal}
              >
                <i className="bx bxs-user-x text-xl"></i>
                <span>Decline</span>
              </Button>
              <Button className="flex items-center space-x-1" onClick={accept}>
                <i className="bx bxs-user-check text-xl"></i>
                <span>Confirm</span>
              </Button>
            </>,
          );
          break;
        }
      }
    }
  }, [relation]);

  return (
    <>
      {isOpenChangePassword && (
        <ChangePassword
          isOpen={isOpenChangePassword}
          setIsOpen={setIsOpenChangePassword}
        />
      )}
      {confirmModal?.isOpen && (
        <ConfirmModal
          isOpen={confirmModal.isOpen}
          closeAction={() => setConfirmModal({ isOpen: false })}
          title="Are you sure?"
          content={confirmModal.content}
          confirmButtonTitle="Yes"
          confirmButtonAction={confirmModal.action}
        />
      )}
      {photoView.isOpen && (
        <ImageView
          isOpen={photoView.isOpen}
          photos={photoView.photos}
          startIndex={photoView.startIndex}
          setIsOpen={(isOpen) => setPhotoView({ isOpen: isOpen })}
        />
      )}
      <input
        id="avatar"
        type="file"
        hidden
        accept="image/png, image/jpg, image/tiff, image/tif, image/jpeg"
        onChange={updateAvatar}
      />
      <input
        id="cover"
        type="file"
        hidden
        accept="image/png, image/jpg, image/tiff, image/tif, image/jpeg"
        onChange={updateCover}
      />
      <div className="absolute top-5 left-0 right-0 bg-gray-100 dark:bg-dark-primary">
        <div className="mt-5 md:mt-10 shadow bg-white dark:bg-dark-secondary ">
          <div className=" flex flex-col items-center max-w-screen-lg md:px-10 mx-auto z-10">
            <div className="relative h-60 md:h-80 w-full flex mb-6 select-none">
              <img
                src={user?.coverUrl ?? DefaultCover}
                alt={`${user?.fullName} cover`}
                className="w-full object-cover rounded-xl cursor-pointer"
                onClick={() =>
                  openPhotoView([{ imageUrl: user?.coverUrl ?? DefaultCover }])
                }
              />
              {isCurrentUser && (
                <label
                  htmlFor="cover"
                  className="absolute right-3 bottom-3 flex items-center space-x-2 bg-white bg-opacity-95 rounded-lg md:p-2 md:px-3 p-1 px-2 text-black hover:bg-gray-200 active:bg-gray-300 active:transform active:scale-95 cursor-pointer transition-base text-sm md:text-base"
                >
                  <i className="bx bxs-camera md:text-base text-xl"></i>
                  <span className="font-semibold hidden md:inline">
                    Edit Cover Photo
                  </span>
                </label>
              )}
              <div className="absolute md:h-44 md:w-44 h-36 w-36 rounded-full left-1/2 transform bottom-0 translate-y-5 -translate-x-1/2 border-4 border-white dark:border-dark-secondary ring-4 ring-green-400 dark:ring-green-500 cursor-pointer">
                <ImageCircle
                  parentClassName="w-full h-full"
                  className="filter hover:brightness-110"
                  src={user?.avatarUrl}
                  userName={isCurrentUser ? "" : user?.userName}
                  size="full"
                  onClick={() => openPhotoView([{ imageUrl: user?.avatarUrl }])}
                />
                {isCurrentUser && (
                  <label htmlFor="avatar">
                    <ClickableIcon
                      reverse
                      className="absolute right-0 bottom-0"
                      iconClass="bx bxs-camera"
                    />
                  </label>
                )}
              </div>
            </div>
            <div className="w-full mx-4 border-b border-gray-400 dark:border-dark-hover pb-6">
              <div className="w-full text-center font-bold text-2xl md:text-4xl md:py-2 py-1 max-row-2">
                {user.fullName}{" "}
                {user.nickName && (
                  <span className="font-normal text-xl md:text-3xl">
                    {`(${user.nickName})`}
                  </span>
                )}
              </div>
              <div className="md:max-w-2/3 max-w-11/12 mx-auto text-center max-row-3 text-sm md:text-base">
                {user.aboutMe}
              </div>
            </div>
            <div className="flex self-end justify-end mt-1 mb-3 md:px-2 px-5 space-x-2">
              {isCurrentUser ? (
                <>
                  <Button
                    onClick={() => setIsOpenChangePassword((pre) => !pre)}
                    secondary
                    className="flex items-center space-x-1"
                  >
                    <i className="bx bxs-check-shield md:text-2xl text-lg"></i>
                    <span>Change password</span>
                  </Button>
                  <Button
                    onClick={() => setIsOpenEdit((pre) => !pre)}
                    secondary
                    className="flex items-center space-x-1"
                  >
                    <i className="bx bxs-edit-alt md:text-2xl text-lg"></i>
                    <span>Edit profile</span>
                  </Button>
                </>
              ) : (
                <div
                  ref={menuRef}
                  className="relative flex space-x-2 space-y-2 flex-wrap justify-end items-end"
                >
                  {relationButton}
                  <Button
                    className="flex items-center space-x-1"
                    onClick={() => handleCreateChat(user.userName)}
                  >
                    <i className="bx bxs-message-rounded-dots text-xl align-middle"></i>
                    <span>Message</span>
                  </Button>
                  <Button
                    className="self-stretch"
                    secondary
                    small
                    onClick={() => setIsOpenMenu((pre) => !pre)}
                  >
                    <i className="bx bx-dots-horizontal-rounded text-2xl align-middle"></i>
                  </Button>
                  {isOpenMenu && (
                    <div className="animate-fadeIn transition-base absolute top-7 p-1 w-44 right-0 border border-gray-200 bg-white rounded-lg shadow-lg overflow-hidden dark:bg-dark-secondary dark:border-dark-hover mt-3 select-none z-10">
                      <button
                        className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-hover text-sm"
                        onClick={() => {
                          if (relation.isFollowing) {
                            unfollow();
                          } else {
                            follow();
                          }
                        }}
                      >
                        <i
                          className={
                            "text-center text-xl align-middle text-black dark:text-dark-txt w-7 h-7 " +
                            (relation.isFollowing
                              ? "bx bx-x-circle"
                              : "bx bx-check-circle")
                          }
                        ></i>
                        <span>
                          {relation.isFollowing ? "Unfollow" : "Follow"}
                        </span>
                      </button>
                      <button
                        className="flex items-center space-x-3 w-full pl-2 pr-4 py-1 rounded-md text-left hover:bg-gray-100 active:bg-gray-200 transition-base transform active:scale-95 dark:hover:bg-dark-hover text-sm"
                        onClick={openBlockModal}
                      >
                        <i className="bx bx-block text-lg text-black dark:text-dark-txt w-7 h-7 text-center align-middle"></i>
                        <span>Block</span>
                      </button>
                    </div>
                  )}
                </div>
              )}
            </div>
          </div>
        </div>
        <div className="md:max-w-4xl pt-2 px-2 pb-10 lg:px-0 mx-auto flex flex-col md:flex-row md:items-start items-center justify-between md:space-x-3">
          <UserInfo
            className={
              "md:sticky top-20 left-0 space-y-2 md:space-y-3 mb-2" +
              " " +
              (isOpenEdit ? "hidden md:block" : "")
            }
            user={user}
          />
          <div className="max-w-xl w-full mx-auto space-y-2 md:space-y-3">
            {isOpenEdit && (
              <EditUser
                isOpen={isOpenEdit}
                setIsOpen={setIsOpenEdit}
                user={user}
              />
            )}
            {isCurrentUser && <CreatePost />}
            {[...posts?.items]
              ?.sort((a, b) => (a.dateCreated < b.dateCreated ? 1 : -1))
              ?.map((post) => (
                <Post key={post.id} post={post} />
              ))}
            <Pagination
              loadMoreClassName="bg-gray-200 hover:bg-gray-300"
              onClick={loadMore}
              isLoading={isLoading}
              error={error}
              isHasMore={isHasMore}
              loadMoreContent="Load more posts..."
            />
            {posts?.totalRecords <= 0 && (
              <div className="text-center py-3 font-semibold">
                Not found any posts
              </div>
            )}
          </div>
        </div>
      </div>
    </>
  );
}

export default Profile;
