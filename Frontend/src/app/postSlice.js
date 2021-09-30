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
      var isExists = state.items.some((post) => post.id === action.payload.id);
      if (!isExists) {
        state?.item?.push(action.payload);
      }
    },
    updatePost: (state, action) => {
      var updatedPost = action.payload;

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
      var postId = action.payload.postId;
      var comment = action.payload.comment;
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
      var postId = action.payload.postId;
      var comment = action.payload.comment;
      if (postId && comment) {
        const postIndex = state?.items?.findIndex((post) => {
          return post.id === postId;
        });
        if (postIndex >= 0) {
          const commentIndex = state?.items[postIndex].comments?.findIndex(
            (comment) => {
              return comment.id === comment.Id;
            },
          );
          if (commentIndex) {
            state.items[postIndex].comments[commentIndex].content =
              comment.content;
          }
        }
      }
    },
    deletePost: (state, action) => {
      var postId = action.payload.postId;
      var commentId = action.payload.commentId;
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
            state.items[postIndex].comments[commentIndex].splice(
              commentIndex,
              1,
            );
          }
        }
      }
    },
  },
});

const reducer = combineReducers({
  posts: posts.reducer,
});

export const { refreshPost, addPost, updatePost, deletePost, loadPost } =
  posts.actions;
export default reducer;
