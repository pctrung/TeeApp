import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router-dom";
import Sidebar from "./components/Sidebar";
import Footer from "./components/Footer";
import { HashRouter as BrowserRouter, Route, Switch } from "react-router-dom";
import Dashboard from "./Dashboard";
import ManagePosts from "./ManagePosts";
import Popup from "components/Popup";
import { setPopup } from "app/appSlice";
import ManageUsers from "./ManageUsers";

function AdminDashboard({ message }) {
  const currentUser = useSelector((state) => state.users.currentUser);
  const history = useHistory();
  const popup = useSelector((state) => state.app.popup);
  const dispatch = useDispatch();

  useEffect(() => {
    if (currentUser?.userName !== "teeadmin") {
      history.push("/NotFound");
    }
  }, [currentUser])

  function closePopup() {
    dispatch(setPopup({ isOpen: false }));
  }

  return (
    <>
      {popup.isOpen && (
        <Popup
          title={popup.title}
          isOpen={popup.isOpen}
          content={popup.content}
          onClick={closePopup}
        />
      )}
      <Sidebar />
      <div className="md:ml-64">
        <Switch>
          <Route path="/admin/posts" component={ManagePosts} />
          <Route path="/admin/users" component={ManageUsers} />
          <Route path="*" component={Dashboard} />
        </Switch>
        <Footer />
      </div>
    </>
  );
}

export default AdminDashboard;
