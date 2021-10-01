import usePostApi from "hooks/usePostApi";
import React from "react";
import { ReactionType, ReactionIcon, ReactionName } from "utils/Enums";

function ReactionInput({ className = "", reacted, postId }) {
  const postApi = usePostApi();

  const addReaction = (type) => {
    if (!reacted) {
      postApi.addReaction(postId, { type });
    } else if (reacted && reacted.type !== type) {
      postApi.updateReaction(postId, { type });
    }
  };
  return (
    <>
      <div
        className={
          className +
          " " +
          "animate-swipeUp space-x-2 rounded-3xl bg-white shadow border-2 border-gray-100 dark:border-dark-hover p-1 transition-base z-50"
        }
      >
        <Reaction
          addReaction={addReaction}
          type={ReactionType.LIKE}
          src={ReactionIcon[ReactionType.LIKE]}
          alt={ReactionName[ReactionType.LIKE]}
        />
        <Reaction
          addReaction={addReaction}
          type={ReactionType.LOVE}
          src={ReactionIcon[ReactionType.LOVE]}
          alt={ReactionName[ReactionType.LOVE]}
        />
        <Reaction
          addReaction={addReaction}
          type={ReactionType.CARE}
          src={ReactionIcon[ReactionType.CARE]}
          alt={ReactionName[ReactionType.CARE]}
        />
        <Reaction
          addReaction={addReaction}
          type={ReactionType.HAHA}
          src={ReactionIcon[ReactionType.HAHA]}
          alt={ReactionName[ReactionType.HAHA]}
        />
        <Reaction
          addReaction={addReaction}
          type={ReactionType.WOW}
          src={ReactionIcon[ReactionType.WOW]}
          alt={ReactionName[ReactionType.WOW]}
        />
        <Reaction
          addReaction={addReaction}
          type={ReactionType.SAD}
          src={ReactionIcon[ReactionType.SAD]}
          alt={ReactionName[ReactionType.SAD]}
        />
        <Reaction
          addReaction={addReaction}
          type={ReactionType.ANGRY}
          src={ReactionIcon[ReactionType.ANGRY]}
          alt={ReactionName[ReactionType.ANGRY]}
        />
      </div>
    </>
  );
}

const Reaction = ({ type, src, alt, addReaction }) => (
  <div
    onClick={() => addReaction(type)}
    className="w-10 hover:scale-125 hover:transform origin-bottom transition-all duration-200 ease-in-out"
  >
    <img src={src} alt={alt} className="w-full h-full" />
  </div>
);

export default ReactionInput;
