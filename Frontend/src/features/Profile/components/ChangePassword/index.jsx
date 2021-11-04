import { yupResolver } from "@hookform/resolvers/yup";
import { setPopup } from "app/appSlice";
import Button from "components/Button";
import useAccountApi from "hooks/api/useAccountApi";
import { useCloseOnClickOutside } from "hooks/utils/useCloseOnClickOutside";
import { useEscToClose } from "hooks/utils/useEscToClose";
import React, { useEffect, useRef, useState } from "react";
import { useForm, useWatch } from "react-hook-form";
import { useDispatch } from "react-redux";
import * as yup from "yup";

export default function ChangePassword({ isOpen, setIsOpen }) {
  const [isChanged, setIsChanged] = useState(false);
  const accountApi = useAccountApi();
  const ref = useRef();
  const dispatch = useDispatch();
  useCloseOnClickOutside(isOpen, setIsOpen, ref);
  useEscToClose(setIsOpen);

  const INPUT_CLASS =
    "bg-gray-100 dark:bg-dark-hover dark:text-white rounded-lg w-full py-2 px-3 focus:ring-2 focus:ring-green-500 dark:focus:ring-green-400 focus:ring-opacity-80 dark:focus:ring-opacity-80 outline-none transition-base";

  function openPopup(title, content) {
    const popup = {
      isOpen: true,
      title: title,
      content: content,
    };
    dispatch(setPopup(popup));
  }

  const schema = yup.object().shape({
    currentPassword: yup.string().required("Current Password is required"),
    newPassword: yup
      .string()
      .required("Current Password is required")
      .test(
        "checkPassword",
        "Password must be at least 8 characters with an uppercase letter and a number",
        (value) => {
          return checkRegex(
            value,
            "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d@$!%*?&]{8,}$",
          );
        },
      ),
    confirmPassword: yup
      .string()
      .required("Confirm Password is required")
      .test(
        "ConfirmPasswordMatch",
        "Password and Confirmation Password must match",
        (confirmPassword) => {
          return confirmPassword === watch.newPassword;
        },
      ),
  });

  // react hook form
  const {
    register,
    handleSubmit,
    control,
    reset,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schema),
    defaultValues: {},
  });
  const watch = useWatch({
    control,
  });

  useEffect(() => {
    const onChange = () => {
      var isValid =
        watch.currentPassword && watch.newPassword && watch.confirmPassword;

      if (isValid) {
        setIsChanged(true);
        return;
      }
      setIsChanged(false);
    };
    onChange();
  }, [watch]);

  // handle submit
  const onSubmit = async (content) => {
    await accountApi.changePassword(content).then((response) => {
      openPopup("Success", "Change password successfully!");
      reset({});
    });
  };
  return (
    <>
      <div
        className="overlay grid place-items-center px-4 py-10 z-30"
        style={{ margin: 0 }}
      >
        <div
          ref={ref}
          className={
            "animate-swipeDown px-6 py-3 pb-6 md:px-14 md:py-6 flex flex-col bg-white dark:bg-dark-secondary dark:border-dark-third rounded-xl shadow-xl border border-gray-300 w-full md:w-5/6 lg:w-2/5 transition-all duration-300 ease-in-out max-h-full overflow-y-auto md:overflow-visible dark:text-white"
          }
        >
          <div className="flex justify-between h-full flex-col space-y-5">
            <h3 className="font-semibold mt-3 text-lg md:text-2xl text-green-600 dark:text-green-400">
              Change Password
            </h3>
            <form
              onSubmit={handleSubmit(onSubmit)}
              className="flex flex-col space-y-2"
            >
              <div className="space-y-2">
                <label
                  htmlFor="currentPassword"
                  className="md:text-lg font-medium "
                >
                  Current Password <span className="text-red-500">*</span>
                </label>
                <input
                  type="password"
                  {...register("currentPassword")}
                  className={INPUT_CLASS}
                />
                <div className="text-red-500 text-sm">
                  {errors.currentPassword?.message}
                </div>
              </div>
              <div className="space-y-2">
                <label
                  htmlFor="newPassword"
                  className="md:text-lg font-medium "
                >
                  New Password <span className="text-red-500">*</span>
                </label>
                <input
                  type="password"
                  {...register("newPassword")}
                  className={INPUT_CLASS}
                />
                <div className="text-red-500 text-sm">
                  {errors.newPassword?.message}
                </div>
              </div>
              <div className="space-y-2">
                <label
                  htmlFor="confirmPassword"
                  className="md:text-lg font-medium "
                >
                  Confirm Password <span className="text-red-500">*</span>
                </label>
                <input
                  type="password"
                  {...register("confirmPassword")}
                  className={INPUT_CLASS}
                />
                <div className="text-red-500 text-sm">
                  {errors.confirmPassword?.message}
                </div>
              </div>
              <div className="flex md:flex-row flex-col-reverse justify-end md:space-x-2">
                <Button
                  outline
                  onClick={(e) => {
                    e.preventDefault();
                    setIsOpen(false);
                  }}
                  content="Close"
                  className="font-bold w-full md:w-auto mt-2 md:mt-0 "
                />
                <Button
                  disabled={!isChanged}
                  content="Save"
                  className="font-bold w-full md:w-auto"
                />
              </div>
            </form>
          </div>
        </div>
      </div>
    </>
  );
}

function checkRegex(value, regex) {
  if (value && regex) {
    var pattern = new RegExp(regex);
    var res = pattern.test(value);
    return res;
  }
}
