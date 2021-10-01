import { useEffect, useState } from "react";
import Logo from "logo-shadow.png";

const Loader = ({ className, isOpen = true }) => {
  let circleCommonClasses =
    "h-3 w-3 bg-gradient-to-br from-green-300 to-green-600 shadow-md rounded-full";
  const [isEnding, setIsEnding] = useState(false);
  useEffect(() => {
    return () => {
      setIsEnding(true);
    };
  }, []);
  return (
    isOpen && (
      <>
        <div
          className={
            "z-50 animate-fadeIn flex flex-col h-screen w-screen justify-center items-center fixed transition-base bg-white dark:bg-dark-secondary" +
            (isEnding ? " hidden" : "") +
            (" " + className ?? "")
          }
        >
          <img src={Logo} className="w-20 h-20 mb-10" alt="logo" />
          <div className="flex-center transition-base">
            <div className={`${circleCommonClasses} mr-3 animate-bounce`}></div>
            <div
              className={`${circleCommonClasses} mr-3 animate-bounce200`}
            ></div>
            <div className={`${circleCommonClasses} animate-bounce400`}></div>
          </div>
        </div>
      </>
    )
  );
};

export default Loader;
