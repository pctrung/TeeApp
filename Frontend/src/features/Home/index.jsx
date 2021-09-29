import SideBar from "features/Home/components/SideBar";
import React from "react";

function Home() {
  return (
    <>
      <div className="grid grid-cols-12 animate-fadeIn">
        <SideBar className="col-span-3 sticky top-20" />
        <div className="col-span-6 max-w-600 mx-auto">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem
          ipsum autem eligendi mollitia neque sint dignissimos blanditiis
          architecto reprehenderit, modi labore explicabo, impedit optio cumque
          maiores ullam quae natus nemo.
        </div>
      </div>
    </>
  );
}

export default Home;
