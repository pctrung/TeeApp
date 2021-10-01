import React from "react";
import ForbidImg from "assets/img/forbid.svg";
import Button from "components/Button";
import { Link } from "react-router-dom";

function Forbid({ message }) {
  return (
    <div className="fixed inset-0 h-screen animate-fadeIn w-screen flex flex-col justify-center items-center space-y-8 px-2">
      <img
        className="md:max-w-xl max-w-xs object-cover"
        src={ForbidImg}
        alt="Error"
      />
      <span className="font-bold text-xl md:text-2xl text-center">
        {message ?? "You don't have permission to access this resources"}
      </span>
      <Link to="/">
        <Button content="Return home page" />
      </Link>
    </div>
  );
}

export default Forbid;
