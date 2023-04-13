import React from "react";
import { MemoryRouter,Route, Routes } from "react-router-dom";
import ApartmentShow from "../pages/ApartmentShow";
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";
import apartments from "../mockApt.js"
describe("<ApartmentShow />", () => {
  it("renders without crashing", () => {
    render(
      <MemoryRouter initialEntries={["/apartmentshow/1"]}>
       < Routes>
        <Route path="/apartmentshow/:id" element={<ApartmentShow apartments={apartments} />}/>
       </Routes>
      </MemoryRouter>
    );
  });
});