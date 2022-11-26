import ClickableIcon from "components/ClickableIcon";
import DefaultImage from "assets/img/default-image.jpg";
import { useDisableBodyScroll } from "hooks/utils/useDisableBodyScroll";
import { useEscToClose } from "hooks/utils/useEscToClose";
import React, { useEffect, useRef, useState } from "react";
import { isVideo } from "utils/UtilityMethods";

function ImageView({ photos: files = [], startIndex = 0, setIsOpen, isOpen }) {
  const [index, setIndex] = useState(startIndex);
  const imageRef = useRef();
  const closeRef = useRef();
  const leftRef = useRef();
  const rightRef = useRef();

  useDisableBodyScroll(isOpen);
  useEscToClose(setIsOpen);

  function nextImage() {
    if (index < files.length - 1) {
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
            "absolute md:left-10 left-5 animate-swipeUp " +
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
            (index < files.length - 1 ? "" : "hidden")
          }
        />

        {isVideo(files[index])
          ? <video className="animate-swipeDown max-h-11/12 max-w-full md:max-w-3/4 min-w-5/12 object-contain rounded" controls>
            <source src={files[index]?.imageUrl} type="video/mp4" />
          </video>
          : <img
            ref={imageRef}
            src={files[index]?.imageUrl ?? DefaultImage}
            alt={files[index]?.caption ?? `Post photo ${index}`}
            className="animate-swipeDown max-h-11/12 max-w-full md:max-w-3/4 min-w-4/12 object-contain rounded"
          />}
      </div>
    </>
  );
}

export default ImageView;
