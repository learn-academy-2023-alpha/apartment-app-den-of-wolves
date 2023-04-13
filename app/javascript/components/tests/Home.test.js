import React from "react";
import { BrowserRouter } from "react-router-dom";
import Home from "../pages/Home";
import "@testing-library/jest-dom";
import { render, screen } from "@testing-library/react";
describe("<Home />", () => {
  it("renders without crashing", () => {
    render(
      <BrowserRouter>
        <Home />
      </BrowserRouter>
    );
  });
});
