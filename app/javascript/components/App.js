import React, { useState } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Header from "./components/Header";
import Footer from "./components/Footer";
import Home from "./pages/Home";
import ApartmentIndex from "./pages/ApartmentIndex";
import ApartmentShow from "./pages/ApartmentShow";
import ApartmentNew from "./pages/ApartmentNew";
import ApartmentEdit from "./pages/ApartmentEdit";
import ProtectedIndex from "./pages/ProtectedIndex";
import NotFound from "./pages/NotFound";
import { useEffect } from "react";
import mockApt from "../mockApt";

const App = (props) => {
  const [apartments, setApartments] = useState(mockApt);

  useEffect(() => {
    readApartments();
  }, []);

  const readApartments = () => {
    fetch("/apartments")
      .then((response) => response.json())
      .then((payload) => setApartments(payload))
      .catch((error) => console.log(error));
  };

  return (
    <div className="page">
      <BrowserRouter>
        <Header {...props} />
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/apartmentindex" element={<ApartmentIndex apartments={apartments} />} />
            <Route path="/apartmentshow/:id" element={<ApartmentShow apartments={apartments}  />} />
            <Route path="/apartmentnew" element={<ApartmentNew />} />
            <Route path="/apartmentedit" element={<ApartmentEdit />} />
            <Route path="/protectedindex" element={<ProtectedIndex apartments={apartments} current_user={props.current_user} />} />
            <Route path="*" element={<NotFound />} />
        </Routes>
        <Footer />
      </BrowserRouter>
    </div>
  );
};

export default App;
