import Button from "components/Button";
import React from "react";
import PropTypes from "prop-types";

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
  return (
    isOpen && (
      <div className="px-4 flex-center overlay" style={{ margin: 0 }}>
        <div className="animate-swipeDown bg-white dark:bg-dark-secondary py-8 px-8 w-full md:w-2/3 lg:w-1/2 flex flex-col justify-between items-start rounded-xl space-y-6 shadow-2xl border border-gray-300">
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
