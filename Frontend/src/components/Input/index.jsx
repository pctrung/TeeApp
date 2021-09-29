import React from "react";

function Input({ value = "", onChange, id, type = "text", className }) {
  return (
    <>
      <input
        value={value}
        onChange={onChange}
        id={id}
        type={type}
        className={
          "bg-gray-100 dark:bg-dark-hover dark:text-white rounded-lg w-full py-2 px-3 focus:ring-2 focus:ring-green-500 dark:focus:ring-green-400 focus:ring-opacity-80 dark:focus:ring-opacity-80 outline-none transition-base" +
          " " +
          className
        }
      />
    </>
  );
}

export default Input;
