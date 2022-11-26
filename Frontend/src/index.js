import React from "react";
import ReactDOM from "react-dom";
import {
  Switch,
  BrowserRouter,
  Route,
  Redirect,
} from "react-router-dom";
import { Provider } from "react-redux";
import store from "app/store";

import App from "./App";

import Login from "pages/Login";
import Register from "pages/Register";
import "./index.css";
import "boxicons/css/boxicons.min.css";
import "@fortawesome/fontawesome-free/css/all.min.css";
import AdminDashboard from "pages/AdminDashboard";
import Policy from "pages/Policy";

ReactDOM.render(
  <React.StrictMode>
    <Provider store={store}>
      <BrowserRouter>
        <Switch>
          <Route exact path="/login" component={Login} />
          <Route exact path="/policy" component={Policy} />
          <Route exact path="/register" component={Register} />
          <PrivateRoute path="/admin" component={AdminDashboard} />
          <PrivateRoute path="*" component={App} />
        </Switch>
      </BrowserRouter>
    </Provider>
  </React.StrictMode>,
  document.getElementById("root"),
);

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
