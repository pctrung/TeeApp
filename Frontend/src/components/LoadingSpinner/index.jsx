import React from "react";
import Spinner from "assets/icons/spinner.svg";

function LoadingSpinner(props) {
  return (
    <>
      <img src={Spinner} alt="spinner" className="animate-spin w-7 h-7" />
    </>
  );
}

export default LoadingSpinner;
