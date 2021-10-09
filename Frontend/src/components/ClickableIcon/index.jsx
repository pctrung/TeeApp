import React from "react";
import PropTypes from "prop-types";

ClickableIcon.propTypes = {
  className: PropTypes.string,
  alt: PropTypes.string,
};

function ClickableIcon({
  className,
  colorClass,
  icon,
  iconClass,
  colorIconClass,
  alt,
  onClick,
  onBlur,
  secondMode,
  reverse,
  innerRef,
}) {
  var color = secondMode
    ? "clickable dark:border-dark-third"
    : "clickable-secondary bg-gray-100 dark:bg-dark-third ";
  color = reverse
    ? "dark:bg-gray-100 dark:hover:bg-gray-200 dark:active:bg-gray-300 bg-dark-third hover:bg-dark-hover border-dark-third active:bg-dark-third"
    : color;

  colorClass = !colorClass || colorClass === "" ? color : colorClass;

  colorIconClass =
    !colorIconClass || colorIconClass === ""
      ? "text-black dark:text-dark-txt"
      : colorIconClass;

  colorIconClass = reverse ? "dark:text-black text-white" : colorIconClass;
  return (
    <>
      <div
        ref={innerRef}
        onBlur={onBlur}
        onClick={onClick}
        className={
          "p-1 flex items-center justify-center rounded-full transition-base cursor-pointer active:scale-90 active:transform select-none flex-shrink-0 " +
          " " +
          colorClass +
          " " +
          (className ?? "")
        }
      >
        {icon ? (
          <img
            alt={alt ?? "Clickable Icon"}
            src={icon}
            onClick={onClick}
            className="w-full align-middle"
          />
        ) : (
          <i
            className={
              "text-center align-middle text-xl w-7 h-7 " +
              " " +
              colorIconClass +
              " " +
              iconClass
            }
          ></i>
        )}
      </div>
    </>
  );
}

export default ClickableIcon;
