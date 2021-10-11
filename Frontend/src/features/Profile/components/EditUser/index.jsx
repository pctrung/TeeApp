import { setCurrentUser } from "app/userSlice";
import Button from "components/Button";
import Input from "components/Input";
import useUserApi from "hooks/api/useUserApi";
import React, { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { Gender } from "utils/Enums";

function EditUser({ isOpen, setIsOpen, user, className }) {
  const [firstName, setFirstName] = useState(user.firstName ?? "");
  const [lastName, setLastName] = useState(user.lastName ?? "");
  const [phoneNumber, setPhoneNumber] = useState(user.phoneNumber ?? "");
  const [email, setEmail] = useState(user.email ?? "");
  const [nickName, setNickName] = useState(user.nickName ?? "");
  const [aboutMe, setAboutMe] = useState(user.aboutMe ?? "");
  const [gender, setGender] = useState(user.gender);
  const [dateOfBirth, setDateOfBirth] = useState(user.dateOfBirth);
  const [isValidButton, setIsValidButton] = useState(false);

  const userApi = useUserApi();
  const dispatch = useDispatch();

  useEffect(() => {
    if (user) {
      setFirstName(user.firstName ?? "");
      setLastName(user.lastName ?? "");
      setPhoneNumber(user.phoneNumber ?? "");
      setEmail(user.email ?? "");
      setNickName(user.nickName ?? "");
      setAboutMe(user.aboutMe ?? "");
      setGender(user.gender);
      setDateOfBirth(user.dateOfBirth);
    }
  }, [user]);
  async function submit() {
    const request = {
      firstName: firstName.substring(0, 30),
      lastName: lastName.substring(0, 30),
      email,
      nickName: nickName?.substring(0, 20),
      aboutMe: aboutMe?.substring(0, 149),
      gender,
      dateOfBirth,
      phoneNumber,
    };
    userApi.updateInformation(request).then((response) => {
      dispatch(setCurrentUser(response));
      setIsOpen(false);
    });
  }
  useEffect(() => {
    if (firstName.trim() && lastName.trim() && email.trim()) {
      setIsValidButton(true);
    } else {
      setIsValidButton(false);
    }
  }, [firstName, lastName, email]);
  return isOpen ? (
    <div
      className={
        "py-4 px-5 max-w-xl min-w-200 bg-white dark:bg-dark-secondary flex flex-col justify-start items-start space-y-3 rounded-xl shadow" +
        " " +
        className
      }
    >
      <h3 className="text-lg font-semibold w-full border-b dark:border-dark-hover pb-2 text-green-600 dark:text-green-400">
        Edit Personal Detail
      </h3>
      <div className="space-y-2 md:space-y-4 md:pt-3 pt-1 w-full">
        <div className="mb-3 flex flex-col md:grid md:grid-cols-2 md:place-items-start space-y-2 md:space-y-0">
          <div className="w-full md:col-span-1 md:mr-2 space-y-2 flex flex-col">
            <label
              htmlFor="fistName"
              className="md:text-base text-sm font-semibold dark:text-dark-txt"
            >
              First Name <span className="text-red-500">*</span>
            </label>
            <Input
              id="firstName"
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
            />
          </div>
          <div className="w-full md:col-span-1 md:ml-2 space-y-2 flex flex-col">
            <label
              htmlFor="lastName"
              className="md:text-base text-sm font-semibold dark:text-dark-txt"
            >
              Last Name <span className="text-red-500">*</span>
            </label>
            <Input
              id="lastName"
              value={lastName}
              onChange={(e) => setLastName(e.target.value)}
            />
          </div>
        </div>
        <div className="w-full space-y-2 flex flex-col">
          <label
            htmlFor="nickName"
            className="md:text-base text-sm font-semibold dark:text-dark-txt"
          >
            Nickname
          </label>
          <Input
            id="nickName"
            value={nickName}
            onChange={(e) => setNickName(e.target.value)}
          />
        </div>
        <div className="w-full space-y-2 flex flex-col">
          <label
            htmlFor="gender"
            className="md:text-base text-sm font-semibold dark:text-dark-txt"
          >
            Gender <span className="text-red-500">*</span>
          </label>
          <div className="flex justify-evenly items-center text-center space-x-1 px-5 select-none relative h-full z-0">
            <label
              className={
                "w-16 flex flex-col py-1 text-sm cursor-pointer z-20 rounded-lg px-3 transition-base space-y-1" +
                " " +
                (gender === Gender.MALE ? "bg-green-500 text-white" : "")
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
                (gender === Gender.FEMALE ? "bg-green-500 text-white" : "")
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
                (gender === Gender.OTHER ? "bg-green-500 text-white" : "")
              }
              htmlFor="other"
            >
              <span className="text-lg">⚥</span>
              <span>Other</span>
            </label>
            <input
              hidden
              id="male"
              name="gender"
              type="radio"
              onChange={() => setGender(Gender.MALE)}
            />
            <input
              hidden
              id="female"
              name="gender"
              type="radio"
              onChange={() => setGender(Gender.FEMALE)}
            />
            <input
              hidden
              id="other"
              name="gender"
              type="radio"
              onChange={() => setGender(Gender.OTHER)}
            />
          </div>
        </div>
        <div className="w-full space-y-2 flex flex-col">
          <label
            htmlFor="dateOfBirth"
            className="md:text-base text-sm font-semibold dark:text-dark-txt"
          >
            Date of Birth <span className="text-red-500">*</span>
          </label>
          <Input
            id="dateOfBirth"
            value={new Date(dateOfBirth).toDateInputValue()}
            onChange={(e) => setDateOfBirth(e.target.value)}
            type="date"
          />
        </div>

        <div className="w-full space-y-2 flex flex-col">
          <label
            htmlFor="email"
            className="md:text-base text-sm font-semibold dark:text-dark-txt"
          >
            Email <span className="text-red-500">*</span>
          </label>
          <Input
            id="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
        <div className="w-full space-y-2 flex flex-col">
          <label
            htmlFor="phoneNumber"
            className="md:text-base text-sm font-semibold dark:text-dark-txt"
          >
            Phone Number
          </label>
          <Input
            type="number"
            id="phoneNumber"
            value={phoneNumber}
            onChange={(e) => setPhoneNumber(e.target.value)}
          />
        </div>
        <div className="w-full space-y-2 flex flex-col">
          <label
            htmlFor="aboutMe"
            className="md:text-base text-sm font-semibold dark:text-dark-txt"
          >
            About Me{" "}
            <span className="font-normal text-sm">
              ({`${aboutMe?.length ?? 0}/150`})
            </span>
          </label>
          <textarea
            rows="3"
            className="bg-gray-100 dark:bg-dark-hover dark:text-white rounded-lg w-full focus:ring-2 focus:ring-green-500 dark:focus:ring-green-400 focus:ring-opacity-60 dark:focus:ring-opacity-80 outline-none transition-base py-2 px-3"
            id="aboutMe"
            value={aboutMe}
            onChange={(e) => {
              if (aboutMe.length < 150) {
                setAboutMe(e.target.value);
              }
            }}
          ></textarea>
        </div>
        <div className="flex flex-col md:flex-row-reverse justify-end space-y-2 md:space-y-0 items-center pt-2">
          <Button
            disabled={!isValidButton}
            className="w-full"
            content="Save"
            onClick={() => submit()}
          />
          <Button
            className="w-full md:mr-2"
            outline
            content="Close"
            onClick={() => setIsOpen(false)}
          />
        </div>
      </div>
    </div>
  ) : (
    ""
  );
}
export default EditUser;

Date.prototype.toDateInputValue = function () {
  var local = new Date(this);
  local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
  return local.toJSON()?.slice(0, 10);
};
