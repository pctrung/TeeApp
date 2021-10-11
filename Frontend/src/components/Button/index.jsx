import React from "react";
import PropTypes from "prop-types";

Button.propTypes = {
  content: PropTypes.string,
  className: PropTypes.string,
};

function Button({
  outline = false,
  content,
  className,
  onClick,
  onBlur,
  disabled,
  children,
  secondary,
  small,
}) {
  const colorClass = secondary
    ? "bg-gray-200 hover:bg-gray-300 active:bg-gray-400 dark:bg-dark-third dark:hover:bg-dark-hover"
    : "bg-gradient-to-br from-green-400 to-green-600 text-white active:from-green-500 active:to-green-600";

  const outlineClass = secondary
    ? ""
    : "ring-inset ring-1 ring-green-500 bg-white dark:bg-transparent dark:hover:bg-green-500 text-green-500 hover:text-white hover:bg-green-400 active:bg-green-500";
  return (
    <>
      <button
        disabled={disabled}
        onClick={onClick}
        onBlur={onBlur}
        className={
          " transition-base text-sm rounded-lg md:text-base duration-200 disabled:opacity-50 outline-none z-0 select-none font-semibold" +
          " " +
          (outline ? outlineClass : colorClass) +
          " " +
          (className ?? "") +
          " " +
          (small ? "px-3 py-1" : "px-4 py-2 min-w-70") +
          " " +
          (!disabled ? "active:scale-95 active:transform" : "cursor-default")
        }
      >
        {content ? content : children}
      </button>
    </>
  );
}

export default Button;
