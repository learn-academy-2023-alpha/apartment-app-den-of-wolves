import React from "react";
import { MemoryRouter,Route, Routes } from "react-router-dom";
import ApartmentShow from "../pages/ApartmentShow";
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";
import apartments from "../mockApt.js"

const renderShow = () => {
  render(
    <MemoryRouter initialEntries={["/apartmentshow/1"]}>
     <Routes>
     <Route path="/apartmentshow/:id" element={<ApartmentShow apartments={apartments} />} />
     </Routes>
    </MemoryRouter>
  );
}

describe("<ApartmentShow />", () => {
  it("shows a street attribute", () => {
    renderShow()
    screen.logTestingPlaygroundURL()
    // const profile = screen.getByText(`Address: ${apartment[0].street}`)
    //   expect(street).toBeInTheDocument()
  })
})