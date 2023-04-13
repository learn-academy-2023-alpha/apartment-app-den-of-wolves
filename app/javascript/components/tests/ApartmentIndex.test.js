import React from "react";
import { BrowserRouter } from "react-router-dom";
import ApartmentIndex from "../pages/ApartmentIndex";
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";

describe("<ApartmentIndex />", () => {
  it("renders without crashing", () => {
    render(
      <BrowserRouter>
        <ApartmentIndex />
      </BrowserRouter>
    );
  });

  it("renders the header", () => {
    render(
      <BrowserRouter>
        <ApartmentIndex />
      </BrowserRouter>
    )

    const header = screen.getByRole('heading', {
        name: /condo listings/i
      })
    expect(header).toBeInTheDocument()
    
  })
});