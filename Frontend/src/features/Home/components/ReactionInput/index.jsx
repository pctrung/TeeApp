import usePostApi from "hooks/api/usePostApi";
import React from "react";
import { ReactionIcon, ReactionName, ReactionType } from "utils/Enums";

function ReactionInput({ className = "", reacted, postId, setIsOpen }) {
  const postApi = usePostApi();

  const addReaction = (type) => {
    if (!reacted) {
      postApi.addReaction(postId, { type });
    } else if (reacted && reacted.type !== type) {
      postApi.updateReaction(postId, { type });
    }
    setIsOpen(false);
  };
  return (
    <>
      <div
        className={
          className +
          " " +
          "flex animate-swipeUp space-x-2 rounded-3xl bg-white dark:bg-dark-secondary shadow border-2 border-gray-100 dark:border-dark-third p-1 transition-base z-10"
        }
      >
        {Object.values(ReactionType).map((type) => (
          <Reaction
            key={"Reaction " + type}
            addReaction={addReaction}
            type={type}
            src={ReactionIcon[type]}
            alt={ReactionName[type]}
          />
        ))}
      </div>
    </>
  );
}

const Reaction = ({ type, src, alt, addReaction }) => (
  <div
    onClick={() => addReaction(type)}
    className="group relative w-10 hover:scale-125 hover:-translate-y-2 hover:transform origin-bottom transition-all duration-300 ease-in-out"
  >
    <div className="animate-fadeIn group-hover:block absolute bottom-full left-1/2 hidden bg-black dark:bg-white dark:bg-opacity-80 bg-opacity-60 px-1 rounded-xl transform -translate-y-1 -translate-x-1/2 text-white dark:text-black text-tiny">
      {alt}
    </div>
    <img src={src} alt={alt} className="w-full h-full" />
  </div>
);

export default ReactionInput;
