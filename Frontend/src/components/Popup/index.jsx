import Button from "components/Button";
import { useDisableBodyScroll } from "hooks/utils/useDisableBodyScroll";
import PropTypes from "prop-types";
import React from "react";

Popup.propTypes = {
  title: PropTypes.string,
  isOpen: PropTypes.bool,
  onClick: PropTypes.func,
};

function Popup({
  title = "Notification",
  isOpen,
  content = "Oops! Something went wrong!",
  onClick,
}) {
  useDisableBodyScroll(isOpen);
  return (
    isOpen && (
      <div className="px-4 flex-center overlay" style={{ margin: 0 }}>
        <div className="animate-swipeDown bg-white dark:bg-dark-secondary md:py-8 md:px-8 py-4 px-5  w-full md:w-2/3 lg:w-1/2 flex flex-col justify-between items-start rounded-xl space-y-8 shadow-2xl border border-gray-300 dark:border-dark-third md:max-w-700">
          <h3 className="font-semibold text-2xl break-words dark:text-dark-txt">
            {title}
          </h3>
          <span className="break-words dark:text-dark-txt">{content}</span>
          <div className="w-full flex justify-end">
            <Button content="Close" onClick={onClick} />
          </div>
        </div>
      </div>
    )
  );
}

export default Popup;
