import React from "react";
import ErrorImg from "assets/img/server-error.svg";
import Button from "components/Button";
import { Link } from "react-router-dom";

function ServerError({ message }) {
  return (
    <div className="z-10 fixed inset-0 h-screen animate-fadeIn w-screen flex flex-col justify-center items-center space-y-8 px-2">
      <img
        className="md:max-w-xl max-w-xs object-cover"
        src={ErrorImg}
        alt="Error"
      />
      <span className="font-bold text-xl md:text-2xl text-center">
        {message ?? "Oops! Something went wrong!"}
      </span>
      <Link to="/">
        <Button content="Return home page" />
      </Link>
    </div>
  );
}

export default ServerError;
