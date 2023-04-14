import React from 'react';
import { render, screen } from '@testing-library/react';
import ApartmentNew from '../pages/ApartmentNew';
import { BrowserRouter } from 'react-router-dom'
    

describe("<ApartmentNew />", () => {
    beforeEach(() => {
        render(
            <BrowserRouter>
                <ApartmentNew />
            </BrowserRouter>
        )
    })

    it("renders the ApartmentNew page for the user", () => {
      const inputTitle = screen.getByText("Create a New Listing")
      expect(inputTitle).toBeInTheDocument   
    })

    it("has a form with entries for street, city, state, manager, email, price, bedrooms, bathrooms, pets, and image", () => {

        expect(screen.getByPlaceholderText(/what is the street\?/i)).toBeInTheDocument
        
        expect(screen.getByRole('textbox', {name: /city/i})).toBeInTheDocument

        expect(screen.getByPlaceholderText(/what is the state\?/i)).toBeInTheDocument

        expect(screen.getByRole('textbox', {name: /manager/i})).toBeInTheDocument

        expect(screen.getByRole('textbox', {name: /email/i})).toBeInTheDocument

        expect(screen.getByRole('textbox', {name: /price/i})).toBeInTheDocument

        expect(screen.getByRole('textbox', {name: /bedrooms/i})).toBeInTheDocument

        expect(screen.getByRole('textbox', {name: /bathrooms/i})).toBeInTheDocument

        expect(screen.getByRole('textbox', {name: /pets/i})).toBeInTheDocument

        expect(screen.getByRole('textbox', {name: /image/iq})).toBeInTheDocument
    })

})
