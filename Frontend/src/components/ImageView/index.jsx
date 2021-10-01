import ClickableIcon from "components/ClickableIcon";
import React, { useEffect, useState } from "react";

function ImageView({ photos = [], startIndex = 0, setIsOpen }) {
  const [index, setIndex] = useState(startIndex);

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
  // Esc to cancel view
  function escFunction(e) {
    if (e.keyCode === 27) {
      setIsOpen(false);
    }
  }
  useEffect(() => {
    document.addEventListener("keydown", escFunction, false);
    return () => {
      document.removeEventListener("keydown", escFunction, false);
    };
  }, []);
  return (
    <>
      <div
        className="px-4 flex-center overlay cursor-default select-none"
        style={{ margin: 0 }}
      >
        <ClickableIcon
          onClick={() => setIsOpen(false)}
          iconClass="bx bx-x"
          className="absolute bg-white md:right-10 right-8 top-8 animate-swipeUp"
        />
        {index > 0 && (
          <ClickableIcon
            onClick={previousImage}
            iconClass="bx bxs-chevron-left"
            className="absolute md:left-10 left-5 animate-swipeUp"
          />
        )}
        {index < photos.length - 1 && (
          <ClickableIcon
            onClick={nextImage}
            iconClass="bx bxs-chevron-right"
            className="absolute md:right-10 right-5 animate-swipeUp"
          />
        )}
        <img
          src={photos[index]?.imageUrl}
          alt={photos[index]?.caption ?? `Post photo ${index}`}
          className="animate-swipeDown max-h-11/12 max-w-full md:max-w-3/4 min-w-2/12 object-contain rounded"
        />
      </div>
    </>
  );
}

export default ImageView;
