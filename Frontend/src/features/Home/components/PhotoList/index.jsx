import ImageView from "components/ImageView";
import React, { useState } from "react";

export default function PhotoList({ photos = [] }) {
  const [isOpen, setIsOpen] = useState(false);
  const [startIndex, setStartIndex] = useState(0);
  if (photos.length < 1) {
    return;
  }
  let list;
  switch (photos.length) {
    case 1:
      list = (
        <OnePhotoList
          setStartIndex={setStartIndex}
          setIsOpen={setIsOpen}
          photos={photos}
        />
      );
      break;
    case 2:
      list = (
        <TwoPhotosList
          setStartIndex={setStartIndex}
          setIsOpen={setIsOpen}
          photos={photos}
        />
      );
      break;
    case 3:
      list = (
        <ThreePhotosList
          setStartIndex={setStartIndex}
          setIsOpen={setIsOpen}
          photos={photos}
        />
      );
      break;
    case 4:
      list = (
        <FourPhotosList
          setStartIndex={setStartIndex}
          setIsOpen={setIsOpen}
          photos={photos}
        />
      );
      break;
    default:
      list = (
        <List
          setStartIndex={setStartIndex}
          setIsOpen={setIsOpen}
          photos={photos}
        />
      );
  }
  return (
    <>
      {isOpen && (
        <ImageView
          isOpen={isOpen}
          photos={photos}
          startIndex={startIndex}
          setIsOpen={setIsOpen}
        />
      )}
      {list}
    </>
  );
}

const OnePhotoList = ({ photos = [], setIsOpen, setStartIndex }) => (
  <>
    <div
      className="w-full max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
      onClick={() => {
        setIsOpen(true);
        setStartIndex(0);
      }}
    >
      <img
        className="object-contain md:max-h-128 max-h-112 w-full"
        src={photos[0].imageUrl}
        alt={photos[0].caption ?? `Post photo ${1}`}
      />
    </div>
  </>
);

const TwoPhotosList = ({ photos = [], setIsOpen, setStartIndex }) => (
  <>
    <div className="grid grid-cols-2 gap-2 overflow-hidden">
      {photos.map((photo, index) => (
        <div
          key={photo.id}
          className="col-span-1 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
          onClick={() => {
            setIsOpen(true);
            setStartIndex(index);
          }}
        >
          <img
            className="object-contain md:max-h-128 max-h-112 h-full w-full"
            src={photo.imageUrl}
            alt={photo.caption ?? `Post photo ${index}`}
          />
        </div>
      ))}
    </div>
  </>
);
const ThreePhotosList = ({ photos = [], setIsOpen, setStartIndex }) => (
  <>
    <div className="grid grid-cols-2 md:grid-cols-3 grid-rows-2 gap-2 h-112 md:h-128 overflow-hidden">
      <div
        className="col-span-2 row-span-1 md:row-span-2 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
        onClick={() => {
          setIsOpen(true);
          setStartIndex(0);
        }}
      >
        <img
          className="object-contain max-h-128 w-full h-full"
          src={photos[0]?.imageUrl}
          alt={photos[0]?.caption ?? `Post photo 1`}
        />
      </div>
      <div
        className="w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
        onClick={() => {
          setIsOpen(true);
          setStartIndex(1);
        }}
      >
        <img
          className="object-cover h-full w-full"
          src={photos[1]?.imageUrl}
          alt={photos[1]?.caption ?? `Post photo 2`}
        />
      </div>
      <div
        className="w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-secondary rounded-xl shadow overflow-hidden"
        onClick={() => {
          setIsOpen(true);
          setStartIndex(2);
        }}
      >
        <img
          className="object-cover h-full w-full"
          src={photos[2]?.imageUrl}
          alt={photos[2]?.caption ?? `Post photo 3`}
        />
      </div>
    </div>
  </>
);
const FourPhotosList = ({ photos = [], setIsOpen, setStartIndex }) => (
  <>
    <div className="grid grid-cols-2 grid-rows-2 gap-2 overflow-hidden h-112 md:h-128">
      <div
        className="w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
        onClick={() => {
          setIsOpen(true);
          setStartIndex(0);
        }}
      >
        <img
          className="object-cover h-full w-full"
          src={photos[0]?.imageUrl}
          alt={photos[0]?.caption ?? `Post photo 1`}
        />
      </div>
      <div
        className="w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
        onClick={() => {
          setIsOpen(true);
          setStartIndex(1);
        }}
      >
        <img
          className="object-cover h-full w-full"
          src={photos[1]?.imageUrl}
          alt={photos[1]?.caption ?? `Post photo 2`}
        />
      </div>
      <div
        className="w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
        onClick={() => {
          setIsOpen(true);
          setStartIndex(2);
        }}
      >
        <img
          className="object-cover h-full w-full"
          src={photos[2]?.imageUrl}
          alt={photos[2]?.caption ?? `Post photo 3`}
        />
      </div>
      <div
        className="w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
        onClick={() => {
          setIsOpen(true);
          setStartIndex(3);
        }}
      >
        <img
          className="object-cover h-full w-full"
          src={photos[3]?.imageUrl}
          alt={photos[3]?.caption ?? `Post photo 4`}
        />
      </div>
    </div>
  </>
);
const List = ({ photos = [], setIsOpen, setStartIndex }) => {
  const remainingPhotos = photos.length - 5 > 0 ? photos.length - 5 : 0;
  return (
    <>
      <div className="grid grid-cols-6 grid-rows-2 gap-2 h-112 md:h-128 overflow-hidden">
        <div
          className="col-span-3 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
          onClick={() => {
            setIsOpen(true);
            setStartIndex(0);
          }}
        >
          <img
            className="object-cover h-full w-full"
            src={photos[0]?.imageUrl}
            alt={photos[0]?.caption ?? `Post photo 1`}
          />
        </div>
        <div
          className="col-span-3 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
          onClick={() => {
            setIsOpen(true);
            setStartIndex(1);
          }}
        >
          <img
            className="object-cover h-full w-full"
            src={photos[1]?.imageUrl}
            alt={photos[1]?.caption ?? `Post photo 2`}
          />
        </div>
        <div
          className="col-span-2 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
          onClick={() => {
            setIsOpen(true);
            setStartIndex(2);
          }}
        >
          <img
            className="object-cover h-full w-full"
            src={photos[2]?.imageUrl}
            alt={photos[2]?.caption ?? `Post photo 3`}
          />
        </div>
        <div
          className="col-span-2 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
          onClick={() => {
            setIsOpen(true);
            setStartIndex(3);
          }}
        >
          <img
            className="object-cover h-full w-full"
            src={photos[3]?.imageUrl}
            alt={photos[3]?.caption ?? `Post photo 4`}
          />
        </div>
        <div
          className="relative col-span-2 w-full flex justify-center max-h-128 bg-gray-100 dark:bg-dark-third rounded-xl shadow overflow-hidden"
          onClick={() => {
            setIsOpen(true);
            setStartIndex(4);
          }}
        >
          <img
            className="object-cover h-full w-full"
            src={photos[4]?.imageUrl}
            alt={photos[4]?.caption ?? `Post photo 5`}
          />
          {remainingPhotos > 0 && (
            <div className="absolute inset-0 text-white dark:text-white bg-black bg-opacity-40 flex-center text-xl md:text-2xl font-bold">
              +{remainingPhotos}
            </div>
          )}
        </div>
      </div>
    </>
  );
};
