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
}) {
  colorClass =
    !colorClass || colorClass === ""
      ? "bg-gray-100 hover:bg-gray-200 active:bg-gray-300 dark:bg-dark-third dark:hover:bg-dark-hover dark:border-dark-third dark:active:bg-dark-third"
      : colorClass;

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
          "p-1 flex items-center justify-center rounded-full transition-base cursor-pointer ease-in active:scale-90 active:transform select-none flex-shrink-0 " +
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
            className="w-full"
          />
        ) : (
          <i
            className={
              "text-center align-middle text-xl w-7 h-7 text-center-middle " +
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
