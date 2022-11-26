import { yupResolver } from "@hookform/resolvers/yup";
import LoginPageImage from "assets/img/login-page.svg";
import Button from "components/Button";
import Loader from "components/Loader";
import Popup from "components/Popup";
import useAccountApi from "hooks/api/useAccountApi";
import { useDebounce } from "hooks/api/useDebounce";
import React, { useEffect, useState } from "react";
import { useForm, useWatch } from "react-hook-form";
import { Link } from "react-router-dom";
import { Gender } from "utils/Enums";
import { checkRegex, identityObjectToString } from "utils/UtilityMethods";
import * as yup from "yup";

function Register() {
  const [isChanged, setIsChanged] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const [isExistsUserName, setIsExistsUserName] = useState(true);
  const [popup, setPopup] = useState({
    isOpen: false,
    content: "",
    title: "Notification",
  });

  const accountApi = useAccountApi();

  const INPUT_CLASS =
    "bg-gray-100 dark:bg-dark-hover dark:text-white rounded-lg w-full py-2 px-3 focus:ring-2 focus:ring-green-500 dark:focus:ring-green-400 focus:ring-opacity-80 dark:focus:ring-opacity-80 outline-none transition-base";

  // yup validation
  const schema = yup.object().shape({
    firstName: yup.string().required("First Name is required"),
    lastName: yup.string().required("Last Name is required"),
    dateOfBirth: yup
      .date()
      .required("Date of Birth is required")
      .test("checkAge", "Must be smaller than today", (value) => {
        var today = new Date();
        return value < today;
      }),
    userName: yup
      .string()
      .required("User Name is required")
      .min(6, "Username must be 6-20 characters")
      .max(20, "Username must be 6-20 characters")
      .test(
        "checkUsername",
        "Username does not contain special characters",
        (value) => {
          return checkRegex(value, "^[a-zA-Z0-9!@#$%^&*)(+=._-]{6,}$");
        },
      )
      .test(
        "existsUsername",
        "Username is already taken",
        (value) => !isExistsUserName,
      ),
    email: yup
      .string()
      .required("Email is required")
      .test("checkEmail", "Email is invalid", (value) => {
        return checkRegex(
          value,
          /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
        );
      }),
    password: yup
      .string()
      .required("Password is required")
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
          return confirmPassword === watch.password;
        },
      ),
  });

  // react hook form
  const {
    register,
    handleSubmit,
    control,
    setError,
    clearErrors,
    reset,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(schema),
    defaultValues: {},
  });
  const watch = useWatch({
    control,
  });
  const debounceUserName = useDebounce(watch.userName);

  useEffect(() => {
    accountApi.checkUserNameExists(debounceUserName).then((response) => {
      if (response.isExists) {
        setError(
          "userName",
          {
            type: "required",
            message: `Username '${debounceUserName}' is already taken`,
          },
          { shouldFocus: true },
        );
        setIsExistsUserName(true);
      } else {
        clearErrors("userName");
        setIsExistsUserName(false);
      }
    });
  }, [debounceUserName]);

  useEffect(() => {
    const onChange = () => {
      var isValid =
        watch.firstName?.trim() &&
        watch.lastName?.trim() &&
        watch.userName?.trim() &&
        watch.email &&
        watch.gender &&
        watch.dateOfBirth &&
        watch.password &&
        watch.confirmPassword &&
        watch.acceptPolicy;

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
    setIsLoading(true);

    // format date
    content.dateOfBirth = new Date(content.dateOfBirth).toDateInputValue();
    await accountApi
      .register(content)
      .then((response) => {
        openPopup(
          "Success",
          <span>
            "Create account successfully! Please{" "}
            <Link className="font-bold text-green-600" to="/login">
              log in
            </Link>
            !"
          </span>,
        );
        reset({});
      })
      .catch((error) => {
        setIsLoading(false);
        let message = error?.errors
          ? identityObjectToString(error?.errors)
          : "";
        openPopup("Notification", message);
      });
    setIsLoading(false);
  };

  function openPopup(title, content) {
    const popup = {
      isOpen: true,
      title: title,
      content: content,
    };
    setPopup(popup);
  }

  return (
    <>
      {isLoading && <Loader />}
      {popup.isOpen && (
        <Popup
          title={popup.title}
          isOpen={popup.isOpen}
          content={popup.content}
          onClick={() => {
            setPopup({ isOpen: false });
          }}
        />
      )}
      <div className="animate-fadeIn fixed inset-0 bg-white dark:bg-dark-primary z-10 h-screen grid lg:grid-cols-2 place-items-center gap-32 md:px-32 px-6 overflow-auto pt-10 pb-20 md:py-0">
        <img src={LoginPageImage} alt="login" className="lg:block hidden" />
        <form
          onSubmit={handleSubmit(onSubmit)}
          className="container rounded-2xl flex flex-col md:max-w-500"
        >
          <h1 className="text-3xl font-bold text-primary text-green-600 dark:text-green-400 text-center mb-8">
            Sign up to TeeApp!
          </h1>
          <div className="mb-3 grid md:grid-cols-4 md:col-span-5 place-items-start ">
            <div className="col-span-2 space-y-2 md:mr-2 w-full">
              <label htmlFor="fistName" className="text-lg font-semibold ">
                First Name <span className="text-red-500">*</span>
              </label>
              <input
                {...register("firstName")}
                type="text"
                className={INPUT_CLASS}
              />
              <div className="text-red-500 text-sm">
                {errors.firstName?.message}
              </div>
            </div>
            <div className="col-span-2 space-y-2 md:ml-2 mt-2 md:mt-0 w-full">
              <label htmlFor="lastName" className="text-lg font-semibold ">
                Last Name <span className="text-red-500">*</span>
              </label>
              <input
                {...register("lastName")}
                type="text"
                className={INPUT_CLASS}
              />
              <div className="text-red-500 text-sm">
                {errors.lastName?.message}
              </div>
            </div>
          </div>
          <div className="space-y-2 mb-3">
            <label htmlFor="userName" className="text-lg font-semibold ">
              Username <span className="text-red-500">*</span>
            </label>
            <input
              {...register("userName")}
              type="text"
              className={INPUT_CLASS}
            />
            <div className="text-red-500 text-sm">
              {errors.userName?.message}
            </div>
          </div>
          <div className="space-y-2 mb-3">
            <label htmlFor="email" className="text-lg font-semibold ">
              Email <span className="text-red-500">*</span>
            </label>
            <input {...register("email")} type="text" className={INPUT_CLASS} />
            <div className="text-red-500 text-sm">{errors.email?.message}</div>
          </div>
          <div className="mb-3 grid grid-cols-2 place-items-start ">
            <div className="col-span-2 md:col-span-1 space-y-2 w-full">
              <label htmlFor="gender" className="text-lg font-semibold ">
                Gender <span className="text-red-500">*</span>
              </label>
              <div className="flex justify-evenly items-center text-center space-x-1 px-5 select-none relative h-full">
                <label
                  className={
                    "w-16 flex flex-col py-1 text-sm cursor-pointer z-20 rounded-lg px-3 transition-base space-y-1" +
                    " " +
                    (watch.gender === Gender.MALE.toString()
                      ? "bg-green-500 text-white"
                      : "")
                  }
                  htmlFor="male"
                >
                  <i className="bx bx-male-sign pt-1 text-lg"></i>
                  <span>Male</span>
                </label>
                <label
                  className={
                    "w-16 flex flex-col py-1 text-sm cursor-pointer z-20 rounded-lg px-1 transition-base space-y-1" +
                    " " +
                    (watch.gender === Gender.FEMALE.toString()
                      ? "bg-green-500 text-white"
                      : "")
                  }
                  htmlFor="female"
                >
                  <i className="bx bx-female-sign pt-1 text-lg"></i>
                  <span>Female</span>
                </label>
                <label
                  className={
                    "w-16 flex flex-col py-1 text-sm cursor-pointer z-20 rounded-lg px-3 transition-base space-y-1" +
                    " " +
                    (watch.gender === Gender.OTHER.toString()
                      ? "bg-green-500 text-white"
                      : "")
                  }
                  htmlFor="other"
                >
                  <span className="text-lg">⚥</span>
                  <span>Other</span>
                </label>
                <input
                  hidden
                  {...register("gender")}
                  id="male"
                  name="gender"
                  type="radio"
                  value={Gender.MALE}
                />
                <input
                  hidden
                  {...register("gender")}
                  id="female"
                  name="gender"
                  type="radio"
                  value={Gender.FEMALE}
                />
                <input
                  hidden
                  {...register("gender")}
                  id="other"
                  name="gender"
                  type="radio"
                  value={Gender.OTHER}
                />
              </div>
              <div className="text-red-500 text-sm">
                {errors.gender?.message}
              </div>
            </div>
            <div className="col-span-2 md:col-span-1 flex flex-col space-y-2 md:ml-2 mt-2 md:mt-0 w-full">
              <label htmlFor="lastName" className="text-lg font-semibold">
                Date of Birth <span className="text-red-500">*</span>
              </label>
              <input
                {...register("dateOfBirth")}
                type="date"
                className={INPUT_CLASS + " w-full"}
              />
              <div className="text-red-500 text-sm">
                {errors.dateOfBirth?.message}
              </div>
            </div>
          </div>
          <div className="space-y-2 mb-2">
            <label htmlFor="password" className="text-lg font-semibold ">
              Password <span className="text-red-500">*</span>
            </label>
            <input
              type="password"
              {...register("password")}
              className={INPUT_CLASS}
            />
            <div className="text-red-500 text-sm">
              {errors.password?.message}
            </div>
          </div>
          <div className="space-y-2 mb-2">
            <label htmlFor="confirmPassword" className="text-lg font-semibold ">
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
          <div className="my-2">
            <input type="checkbox" id="acceptPolicy" {...register("acceptPolicy")} />
            <label htmlFor="acceptPolicy" className="ml-3 cursor-pointer">I agree to the <Link to="/policy" className="text-green-500 font-semibold" target="_blank">TeeApp Terms & Policy</Link>.</label>
          </div>
          <Button
            disabled={!isChanged}
            content="Sign Up"
            className="mb-4 mt-2 font-bold"
          />
          <div className="text-center">
            Already a member?{" "}
            <Link
              to="/login"
              className="text-green-600 dark:text-green-400 font-bold"
            >
              Log in
            </Link>
          </div>
        </form>
      </div>
    </>
  );
}

export default Register;

Date.prototype.toDateInputValue = function () {
  var local = new Date(this);
  local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
  return local.toJSON()?.slice(0, 10);
};
