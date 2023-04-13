import React from "react";
import { BrowserRouter } from "react-router-dom";
import ProtectedIndex from "../pages/ProtectedIndex";
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";

describe("<ProtectedIndex />", () => {
  it("renders without crashing", () => {
    render(
      <BrowserRouter>
        <ProtectedIndex />
      </BrowserRouter>
    );
  });

  it("renders the header", () => {
    render(
      <BrowserRouter>
        <ProtectedIndex />
      </BrowserRouter>
    );

    const header = screen.getByRole("heading", {
      name: /My condo listings/i,
    });
    expect(header).toBeInTheDocument();
  });
});
