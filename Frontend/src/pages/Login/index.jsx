import LoginPageImage from "assets/img/login-page.svg";
import Button from "components/Button";
import Input from "components/Input";
import Loader from "components/Loader";
import useAccountApi from "hooks/api/useAccountApi";
import Logo from "logo-shadow.png";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";

function Login() {
  const [username, setUsername] = useState("");
  const [error, setError] = useState("");
  const [password, setPassword] = useState("");
  const [isDirty, setIsDirty] = useState(false);
  const [isLoading, setIsLoading] = useState(false);

  const accountApi = useAccountApi();

  useEffect(() => {
    if (username && password) {
      setIsDirty(true);
    } else {
      setIsDirty(false);
    }
  }, [username, password]);
  async function login(e) {
    e.preventDefault();
    setIsLoading(true);
    const request = { username, password };
    setError("");

    await accountApi
      .login(request)
      .then((response) => {
        if(response.statusCode === 200){
          window.localStorage.setItem("token", response.data);
          window.location.href = process.env.PUBLIC_URL + "/";
        } else {
          var message = response?.message ?? "Oops, something went wrong! Please contact administrator.";
          setError(message);
        }
      })
      .catch((error) => {
        var message =
          typeof error === "string"
            ? error
            : "Oops, something went wrong! Please contact administrator.";
        setError(message);
      });
    setIsLoading(false);
  }
  return (
    <>
      {isLoading && <Loader />}
      <div className="animate-fadeIn fixed inset-0 bg-white dark:bg-dark-primary z-10 h-screen grid lg:grid-cols-2 place-items-center gap-32 md:px-32 px-6 overflow-auto">
        <img src={LoginPageImage} alt="login" className="lg:block hidden" />
        <form
          onSubmit={(e) => login(e)}
          className="container rounded-2xl flex flex-col md:max-w-450"
        >
          <img src={Logo} alt="login" className="h-20 w-20 mx-auto mb-3" />
          <h1 className="text-3xl font-bold text-primary text-green-600 dark:text-green-400 text-center mb-8">
            Login to TeeApp!
          </h1>

          {error && (
            <span className="bg-red-500 rounded-md text-white text-lg mb-2 py-2 text-center">
              {error ?? "Username or password is incorrect"}
            </span>
          )}
          <div className="space-y-2 mb-3">
            <label htmlFor="username" className="text-lg font-semibold px-1">
              Username or email address
            </label>
            <Input
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              id="username"
              type="text"
            />
          </div>
          <div className="space-y-2 mb-2">
            <label htmlFor="password" className="text-lg font-semibold px-1">
              Password
            </label>
            <Input
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              type="password"
              id="password"
            />
          </div>

          <Button
            disabled={!isDirty}
            content="Login"
            className="mb-4 mt-2 font-bold"
          />
          <div className="text-center">
            Not a member?{" "}
            <Link
              to="/register"
              className="text-green-600 dark:text-green-400 font-bold"
            >
              Sign up now
            </Link>
          </div>
        </form>
      </div>
    </>
  );
}

export default Login;
