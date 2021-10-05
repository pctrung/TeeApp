import React from "react";

function Input({
  value = "",
  onChange,
  id,
  type = "text",
  className,
  disabled,
  small,
}) {
  return (
    <>
      <input
        disabled={disabled}
        value={value}
        onChange={onChange}
        id={id}
        type={type}
        className={
          "bg-gray-100 dark:bg-dark-hover dark:text-white rounded-lg w-full focus:ring-2 focus:ring-green-500 dark:focus:ring-green-400 focus:ring-opacity-60 dark:focus:ring-opacity-80 outline-none transition-base" +
          " " +
          (disabled ? "select-none text-gray-500 dark:text-black" : "") +
          " " +
          (small ? "py-1 px-2 " : "py-2 px-3") +
          " " +
          className
        }
      />
    </>
  );
}

export default Input;
