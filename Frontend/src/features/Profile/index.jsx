import useUserApi from "hooks/api/useUserApi";
import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

function Profile() {
  const { userName } = useParams();
  const userApi = useUserApi();
  const [user, setUser] = useState({});

  useEffect(() => {
    if (userApi && userName) {
      userApi.getByUserName(userName).then((response) => {
        setUser(response);
      });
    }
  }, [userName]);
  return (
    <>
      <div>{JSON.stringify(user)}</div>
    </>
  );
}

export default Profile;
