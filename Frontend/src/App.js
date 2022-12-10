import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { BrowserRouter, Route, Switch } from "react-router-dom";

import { addNotification, setPopup } from "app/appSlice";
import Loader from "components/Loader";
import Popup from "components/Popup";
import Forbid from "pages/Forbid";
import NotFound from "pages/NotFound";
import ServerError from "pages/ServerError";

import Home from "features/Home";
import Header from "features/Header";
import Profile from "features/Profile";

import Chat from "features/Chat";
import { AppClient } from "utils/Constants";
import { HubConnectionBuilder } from "@microsoft/signalr";
import {
  addComment,
  updateComment,
  deleteComment,
  deleteReaction,
  updateReaction,
  addReaction,
  updatePost,
  deletePost,
  addNewPost,
} from "app/postSlice";
import PostDetail from "pages/PostDetail";
import Friends from "features/Friends";
import Search from "pages/Search";

function App(props) {
  const isLoading = useSelector((state) => state.app.isLoading);
  const popup = useSelector((state) => state.app.popup);

  const dispatch = useDispatch();

  const [connection, setConnection] = useState(null);

  function closePopup() {
    dispatch(setPopup({ isOpen: false }));
  }

  // for realtime
  useEffect(() => {
    const newConnection = new HubConnectionBuilder()
      .withUrl(process.env.REACT_APP_APP_HUB_URL, {
        accessTokenFactory: () => localStorage.getItem("token"),
      })
      .withAutomaticReconnect()
      .build();

    setConnection(newConnection);
  }, []);

  useEffect(() => {
    if (connection && !connection.connectionStarted) {
      connection.start().then((result) => {
        connection.on(AppClient.RECEIVE_NOTIFICATION, (response) => {
          dispatch(addNotification(response));
        });
        connection.on(AppClient.RECEIVE_POST, (response) => {
          dispatch(addNewPost());
        });
        connection.on(AppClient.RECEIVE_UPDATED_POST, (response) => {
          dispatch(updatePost(response));
        });
        connection.on(AppClient.DELETE_POST, (postId) => {
          dispatch(deletePost(postId));
        });
        connection.on(AppClient.RECEIVE_REACTION, (response) => {
          dispatch(addReaction(response));
        });
        connection.on(AppClient.RECEIVE_UPDATED_REACTION, (response) => {
          dispatch(updateReaction(response));
        });
        connection.on(AppClient.DELETE_REACTION, (postId, reactionId) => {
          dispatch(deleteReaction({ postId, reactionId }));
        });
        connection.on(AppClient.RECEIVE_COMMENT, (response) => {
          dispatch(addComment(response));
        });
        connection.on(AppClient.RECEIVE_UPDATED_COMMENT, (response) => {
          dispatch(updateComment(response));
        });
        connection.on(AppClient.DELETE_COMMENT, (postId, commentId) => {
          dispatch(deleteComment({ postId, commentId }));
        });
      });
    }
    return () => {
      if (connection && connection.connectionStarted) {
        connection.stop();
      }
    };
  }, [connection]);

  return (
    <>
      <BrowserRouter>
        {isLoading && <Loader isOpen={isLoading} className="z-50" />}
        {popup.isOpen && (
          <Popup
            title={popup.title}
            isOpen={popup.isOpen}
            content={popup.content}
            onClick={closePopup}
          />
        )}
        <Chat />
        <Header className="fixed top-0 w-screen" />
        <div className="p-2 bg-gray-100 dark:bg-dark-primary dark:text-white min-h-screen pt-16 pb-10 w-screen">
          <div className="w-full md:max-w-screen-xl mx-auto pt-2 md:pt-4">
            <Switch>
              <Route path="/search/:keyword?" component={Search} />
              <Route exact path="/Forbid" component={Forbid} />
              <Route exact path="/ServerError" component={ServerError} />
              <Route exact path="/friends" component={Friends} />
              <Route exact path="/profile/:userName" component={Profile} />
              <Route exact path="/posts/:postId" component={PostDetail} />
              <Route exact path="/" component={Home} />
              <Route path="*" component={NotFound} />
            </Switch>
          </div>
        </div>
      </BrowserRouter>
    </>
  );
}

export default App;
