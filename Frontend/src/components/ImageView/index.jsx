import ClickableIcon from "components/ClickableIcon";
import { useDisableBodyScroll } from "hooks/utils/useDisableBodyScroll";
import { useEscToClose } from "hooks/utils/useEscToClose";
import React, { useEffect, useRef, useState } from "react";

function ImageView({ photos = [], startIndex = 0, setIsOpen, isOpen }) {
  const [index, setIndex] = useState(startIndex);
  const imageRef = useRef();
  const closeRef = useRef();
  const leftRef = useRef();
  const rightRef = useRef();

  useDisableBodyScroll(isOpen);
  useEscToClose(setIsOpen);

  function nextImage() {
    if (index < photos.length - 1) {
      setIndex(index + 1);
    }
  }
  function previousImage() {
    if (index > 0) {
      setIndex(index - 1);
    }
  }

  useEffect(() => {
    const checkIfClickedOutside = (e) => {
      if (
        isOpen &&
        imageRef.current &&
        !imageRef.current.contains(e.target) &&
        closeRef.current &&
        !closeRef.current.contains(e.target) &&
        rightRef.current &&
        !rightRef.current.contains(e.target) &&
        leftRef.current &&
        !leftRef.current.contains(e.target)
      ) {
        setIsOpen(false);
      }
    };
    document.addEventListener("mousedown", checkIfClickedOutside);
    return () => {
      document.removeEventListener("mousedown", checkIfClickedOutside);
    };
  }, [isOpen]);
  return (
    <>
      <div
        className="px-4 flex-center overlay cursor-default select-none"
        style={{ margin: 0 }}
      >
        <ClickableIcon
          innerRef={closeRef}
          reverse
          onClick={() => setIsOpen(false)}
          iconClass="bx bx-x"
          className="absolute bg-white md:right-10 right-8 top-8 animate-swipeUp"
        />

        <ClickableIcon
          innerRef={leftRef}
          reverse
          onClick={previousImage}
          iconClass="bx bxs-chevron-left"
          className={
            "absolute md:right-10 right-5 animate-swipeUp " +
            (index > 0 ? "" : "hidden")
          }
        />

        <ClickableIcon
          innerRef={rightRef}
          reverse
          onClick={nextImage}
          iconClass="bx bxs-chevron-right"
          className={
            "absolute md:right-10 right-5 animate-swipeUp " +
            (index < photos.length - 1 ? "" : "hidden")
          }
        />

        <img
          ref={imageRef}
          src={photos[index]?.imageUrl}
          alt={photos[index]?.caption ?? `Post photo ${index}`}
          className="animate-swipeDown max-h-11/12 max-w-full md:max-w-3/4 min-w-2/12 object-contain rounded"
        />
      </div>
    </>
  );
}

export default ImageView;
