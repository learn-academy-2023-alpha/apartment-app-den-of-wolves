import React, { useState } from 'react'
import { NavLink } from 'react-router-dom'
import { Nav, NavItem, Collapse, Navbar, NavbarToggler, NavbarBrand } from 'reactstrap'

const Navigation = ({
  logged_in,
  current_user,
  new_user_route,
  sign_in_route,
  sign_out_route
}) => {
  const [collapsed, setCollapsed] = useState(true)

  const toggleNavbar = () => setCollapsed(!collapsed)

  return (
    <div>
      <Navbar className='navigation'>
        <NavbarBrand href='/'>
          <img
            className='logo'
            alt='Welcome!'
            src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqPm4C_IqRo2vS2vDduOn0RKpWAsZUHNI3o5em60RgdsE508xvUBiNUWfGHYPWre534pc&usqp=CAU'
          />
        </NavbarBrand>
        <NavbarToggler className='hamburger' onClick={toggleNavbar} />
        <Collapse isOpen={!collapsed} navbar>
          <Nav navbar>
            <NavItem>
              <NavLink to='apartmentindex'>🏢 Explore your prospects!</NavLink>
            </NavItem>
            {logged_in ?
              <>
                <NavItem>
                  <NavLink to='protectedindex'>🏢 Manage your community!</NavLink>
                </NavItem>
                <NavItem>
                  <NavLink to='apartmentnew'>🏢 Broaden your horizons!</NavLink>
                </NavItem>
                <NavItem>
                  <a href={sign_out_route}>Check out!</a>
                </NavItem>
              </> :
              <>
                <NavItem>
                  <a href={sign_in_route}>Check in!</a>
                </NavItem>
                <NavItem>
                  <a href={new_user_route}>Join the club!</a>
                </NavItem>
              </>}
          </Nav>
        </Collapse>
      </Navbar>
    </div>
  )
}

export default Navigation