import { useEffect } from "react";

export const useEscToClose = (setIsOpen) => {
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
};
