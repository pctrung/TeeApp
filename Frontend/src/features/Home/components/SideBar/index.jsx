import React from "react";
import PropTypes from "prop-types";

SideBar.propTypes = {};

function SideBar({ className }) {
  return (
    <>
      <div className={"  " + " " + className}>Side bar</div>
    </>
  );
}

export default SideBar;
