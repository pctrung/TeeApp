import Button from "components/Button";
import { useDisableBodyScroll } from "hooks/utils/useDisableBodyScroll";
import PropTypes from "prop-types";
import React from "react";

ConfirmModal.propTypes = {
  title: PropTypes.string,
  isOpen: PropTypes.bool,
  confirmButtonTitle: PropTypes.string,
  confirmButtonAction: PropTypes.func,
};

function ConfirmModal({
  title,
  isOpen,
  content = "Are you sure?",
  closeAction,
  confirmButtonTitle,
  confirmButtonAction,
}) {
  useDisableBodyScroll(isOpen);
  return (
    isOpen && (
      <div className="px-4 overlay flex-center " style={{ margin: 0 }}>
        <div className="animate-swipeDown bg-white dark:bg-dark-secondary dark:border-dark-third md:py-8 md:px-8 py-4 px-5 w-full md:w-2/3 lg:w-1/2 flex flex-col justify-between items-start rounded-xl space-y-8 shadow-2xl border border-gray-300 md:max-w-700">
          <h3 className="font-semibold text-2xl break-words dark:text-dark-txt">
            {title !== "" ? title : "Notification"}
          </h3>
          <span className="break-words dark:text-dark-txt w-full">{content}</span>
          <div className="w-full flex justify-end space-x-2">
            <Button outline content="No" onClick={closeAction} />
            <Button
              content={confirmButtonTitle ?? "Ok"}
              onClick={() => {
                confirmButtonAction();
                closeAction();
              }}
            />
          </div>
        </div>
      </div>
    )
  );
}

export default ConfirmModal;
