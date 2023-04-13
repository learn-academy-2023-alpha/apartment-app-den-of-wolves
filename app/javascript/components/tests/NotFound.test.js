import React from "react";
import { BrowserRouter } from "react-router-dom";
import NotFound from "../pages/NotFound";
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";

describe("<NotFound />", () => {
  it("renders without crashing", () => {
    render(
      <BrowserRouter>
        <NotFound />
      </BrowserRouter>
    );
  });

  it("renders the header", () => {
    render(
      <BrowserRouter>
        <NotFound />
      </BrowserRouter>
    );

    const header = screen.getByRole("heading", {
      name: /Sorry the page that you are looking for doesn't exist./i,
    });
    expect(header).toBeInTheDocument();
  });
});
