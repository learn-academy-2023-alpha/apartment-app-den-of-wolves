import React from 'react'
import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { BrowserRouter } from 'react-router-dom'
import Navigation from '../components/Navigation'
import '@testing-library/jest-dom'

describe('<Navigation />', () => {
  renderNavigation = () => {
    render(
      <BrowserRouter>
        <Navigation 
          logged_in={false}
          current_user={''}
          new_user_route={''}
          sign_in_route={''}
          sign_out_route={''}
        />
      </BrowserRouter>
    )
  }

  userNavigation = () => {
    render(
      <BrowserRouter>
          <Navigation 
            logged_in={true}
            current_user={''}
            new_user_route={''}
            sign_in_route={''}
            sign_out_route={''}
          />
      </BrowserRouter>
    )
  }

  it('Renders a component', () => {
    renderNavigation()
  })

  it('when not logged in, has links to home, index, log in, and new user; cannot access my apartments or new apartment', () => {
    renderNavigation()

    // Home
    userEvent.click(screen.getByText('Welcome!'))
    expect(screen.getByText('Welcome!')).toBeInTheDocument()

    // Index
    userEvent.click(screen.getByText('🏢 Explore your prospects!'))
    expect(screen.getByText('🏢 Explore your prospects!')).toBeInTheDocument()

    // My apartments
    expect(screen.queryByText('🏢 Manage your community!')).toBeNull()

    // New apartment
    expect(screen.queryByText('🏢 Broaden your horizons!')).toBeNull()

    // Log out
    expect(screen.queryByText('Check out!')).toBeNull()

    // Log in
    userEvent.click(screen.getByText('Check in!'))
    expect(screen.getByText('Check in!')).toBeInTheDocument()

    // New account
    userEvent.click(screen.getByText('Join the club!'))
    expect(screen.getByText('Join the club!')).toBeInTheDocument()
  })

  it('when logged in, has links to home, index, log out, my apartments, and new apartment; cannot access log out or new user', () => {
    userNavigation()

    // Home
    userEvent.click(screen.getByAlt('Welcome!'))
    expect(screen.getByText('Welcome!')).toBeInTheDocument()

    // Index
    userEvent.click(screen.getByText('🏢 Explore your prospects!'))
    expect(screen.getByText('🏢 Explore your prospects!')).toBeInTheDocument()

    // My apartments
    userEvent.click(screen.getByText('🏢 Manage your community!'))
    expect(screen.getByText('🏢 Manage your community!')).toBeInTheDocument()

    // New apartment
    userEvent.click(screen.getByText('🏢 Broaden your horizons!'))
    expect(screen.getByText('🏢 Broaden your horizons!')).toBeInTheDocument()

    // Log out
    userEvent.click(screen.getByText('Check out!'))
    expect(screen.getByText('Check out!')).toBeInTheDocument()

    // Log in
    expect(screen.queryByText('Check in!')).toBeNull()

    // New account
    expect(screen.queryByText('Join the club!')).toBeNull()
  })
})