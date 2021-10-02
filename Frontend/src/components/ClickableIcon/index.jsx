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
}) {
  const color = secondMode
    ? "hover:bg-gray-100 active:bg-gray-200 dark:hover:bg-dark-third dark:border-dark-third"
    : "bg-gray-100 hover:bg-gray-200 active:bg-gray-300 dark:bg-dark-third dark:hover:bg-dark-hover dark:border-dark-third dark:active:bg-dark-third";
  colorClass = !colorClass || colorClass === "" ? color : colorClass;

  colorIconClass =
    !colorIconClass || colorIconClass === ""
      ? "text-black dark:text-dark-txt"
      : colorIconClass;
  return (
    <>
      <div
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
              "text-center align-middle items text-xl w-7 h-7 text-center-middle " +
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
