import React from 'react';
import { MemoryRouter, Route, Routes } from 'react-router-dom';
import ApartmentShow from '../pages/ApartmentShow';
import '@testing-library/jest-dom';
import { render, screen } from '@testing-library/react';
import apartments from '../mockApt.js'

describe('<ApartmentShow />', () => {
  const renderApartmentShow = () => {
    render(
      <MemoryRouter initialEntries={['/apartmentshow/1']}>
        <Routes>
          <Route path='/apartmentshow/:id' element={<ApartmentShow apartments={apartments} />} />
        </Routes>
      </MemoryRouter>
    )
  }

  it('renders without crashing', () => {
    renderApartmentShow()
  })

  it('displays content from the apartment', () => {
    renderApartmentShow()

    expect(screen.getByRole('img', { name: apartments[0].name})).toBeInTheDocument
    expect(screen.getByRole('heading', { name: /123 fourth st san diego, ca/i})).toBeInTheDocument
    expect(screen.getByText(/previous/i)).toBeInTheDocument
    expect(screen.getByText(/next/i)).toBeInTheDocument
    expect(screen.getByRole('link', {name: /back to all apartments/i})).toBeInTheDocument
  })
})