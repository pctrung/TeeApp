import { addPost } from "app/postSlice";
import Post from "features/Home/components/Post";
import usePostApi from "hooks/api/usePostApi";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory, useParams } from "react-router";

function PostDetail() {
  const { postId } = useParams();
  const posts = useSelector((state) => state.posts.posts);
  const [post, setPost] = useState({ reactions: [], comments: [], photos: [] });
  const postApi = usePostApi();
  const dispatch = useDispatch();
  const history = useHistory();

  useEffect(() => {
    if (postId && posts) {
      const findPost = posts?.items?.find(
        (post) => post.id.toString() === postId,
      );
      if (findPost) {
        setPost(findPost);
      } else {
        postApi
          .getById(postId)
          .then((response) => {
            setPost(response);
            dispatch(addPost(response));
          })
          .catch((response) => {
            history.push("/NotFound");
          });
      }
    }
  }, [postId, posts]);
  return <>{post?.dateCreated && <Post post={post} isOpenComment={true} />}</>;
}

export default PostDetail;
