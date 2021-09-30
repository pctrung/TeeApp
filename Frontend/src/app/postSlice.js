import { combineReducers, createSlice } from "@reduxjs/toolkit";

const posts = createSlice({
  name: "posts",
  initialState: { items: [] },
  reducers: {
    refreshPost: (state, action) => {
      state = action.payload;
      return state;
    },
    addPost: (state, action) => {
      const isExists = state.items.some(
        (post) => post.id === action.payload.id,
      );
      if (!isExists) {
        state?.item?.push(action.payload);
      }
    },
    updatePost: (state, action) => {
      const updatedPost = action.payload;

      const index = state?.items?.findIndex((post) => {
        return post.id === updatedPost.id;
      });
      if (index >= 0) {
        state.items[index].content = updatedPost.content;
        state.items[index].privacy = updatedPost.privacy;
      } else {
        state.push(updatedPost);
      }
    },
    deletePost: (state, action) => {
      const index = state?.items?.findIndex((post) => {
        return post.id === action.payload;
      });
      if (index >= 0) {
        state.items.splice(index, 1);
      }
    },
    loadPost: (state, action) => {
      if (action.payload.page > state.page) {
        const posts = action.payload;
        state.totalRecords = posts.totalRecords;
        state.limit = posts.limit;
        state.page = posts.page;
        state.pageCount = posts.pageCount;
        state.items = state.items.concat(posts.items);
      }
    },
    addComment: (state, action) => {
      const postId = action.payload.postId;
      const comment = action.payload.comment;
      if (postId && comment) {
        const index = state?.items?.findIndex((post) => {
          return post.id === postId;
        });
        if (index >= 0) {
          state.items[index].comments.push(comment);
        }
      }
    },
    updateComment: (state, action) => {
      const postId = action.payload.postId;
      const updatedComment = action.payload.comment;

      if (postId && updatedComment) {
        const postIndex = state?.items?.findIndex((post) => {
          return post.id === postId;
        });
        if (postIndex >= 0) {
          const commentIndex = state?.items[postIndex].comments?.findIndex(
            (comment) => {
              return comment.id === updatedComment.id;
            },
          );
          if (commentIndex >= 0) {
            state.items[postIndex].comments[commentIndex].content =
              updatedComment.content;
          }
        }
      }
    },
    deleteComment: (state, action) => {
      const postId = action.payload.postId;
      const commentId = action.payload.commentId;

      if (postId && commentId) {
        const postIndex = state?.items?.findIndex((post) => {
          return post.id === postId;
        });
        if (postIndex >= 0) {
          const commentIndex = state?.items[postIndex].comments?.findIndex(
            (comment) => {
              return comment.id === commentId;
            },
          );
          if (commentIndex) {
            state.items[postIndex].comments.splice(commentIndex, 1);
            return state;
          }
        }
      }
    },
  },
});

const reducer = combineReducers({
  posts: posts.reducer,
});

export const {
  refreshPost,
  addPost,
  updatePost,
  deletePost,
  addComment,
  updateComment,
  deleteComment,
  loadPost,
} = posts.actions;
export default reducer;
