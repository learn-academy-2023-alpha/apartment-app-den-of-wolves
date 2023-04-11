import React from 'react'
import { BrowserRouter, Routes, Route } from "react-router-dom"
import Header from './components/Header'
import Footer from './components/Footer'
import Home from './pages/Home'
import ApartmentIndex from './pages/ApartmentIndex'
import ApartmentShow from './pages/ApartmentShow'
import ApartmentNew from './pages/ApartmentNew'
import ApartmentEdit from './pages/ApartmentEdit'
import ProtectedIndex from './pages/ProtectedIndex'
import NotFound from './pages/NotFound'


const App = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
}) => {
  return (
    <>
    <BrowserRouter>
        <Header />
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/apartmentindex" element={<ApartmentIndex />} />
            <Route path="/apartmentshow" element={<ApartmentShow />} />
            <Route path="/apartmentnew" element={<ApartmentNew />} />
            <Route path="/apartmentedit" element={<ApartmentEdit />} />
            <Route path="/protectedindex" element={<ProtectedIndex />} />
            <Route path="*" element={<NotFound />} />
        </Routes>
        <Footer />
    </BrowserRouter>
</>
  )
}

export default App