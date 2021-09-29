import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { BrowserRouter, Redirect, Route, Switch } from "react-router-dom";

import { addNotification, setPopup } from "app/appSlice";
import Loader from "components/Loader";
import Popup from "components/Popup";
import Forbid from "pages/Forbid";
import NotFound from "pages/NotFound";
import ServerError from "pages/ServerError";

import Home from "features/Home";
import Header from "features/Header";

import Login from "pages/Login";
import Register from "pages/Register";
import { setCurrentUser } from "app/userSlice";
import useUserApi from "hooks/useUserApi";
import Chat from "features/Chat";
import { AppClient } from "utils/Constants";
import { HubConnectionBuilder } from "@microsoft/signalr";

function App() {
  const isLoading = useSelector((state) => state.app.isLoading);
  const popup = useSelector((state) => state.app.popup);
  const currentUser = useSelector((state) => state.users.currentUser);
  const dispatch = useDispatch();

  const userApi = useUserApi();

  function closePopup() {
    dispatch(setPopup({ isOpen: false }));
  }

  useEffect(() => {
    userApi.getCurrentUser().then((response) => {
      dispatch(setCurrentUser(response));
    });
  }, []);

  const [connection, setConnection] = useState(null);

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
      <BrowserRouter basename={process.env.PUBLIC_URL}>
        <Loader isOpen={isLoading} className="z-50" />
        <Popup
          title={popup.title}
          isOpen={popup.isOpen}
          content={popup.content}
          onClick={closePopup}
        />
        <Chat />
        <Header user={currentUser} />
        <div className="bg-gray-100 dark:bg-dark-primary dark:text-white min-h-screen pt-20">
          <div className="container mx-auto">
            <Switch>
              <Route exact path="/Forbid" component={Forbid} />
              <Route exact path="/ServerError" component={ServerError} />
              <Route exact path="/login" component={Login} />
              <Route exact path="/register" component={Register} />
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

function PrivateRoute({ component: Component, ...rest }) {
  var isLogin = window.localStorage.getItem("token") ? true : false;

  return (
    <Route
      {...rest}
      render={(props) =>
        isLogin === true ? (
          <Component {...props} />
        ) : (
          <Redirect
            to={{ pathname: "/login", state: { from: props.location } }}
          />
        )
      }
    />
  );
}
