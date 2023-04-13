import React from "react";
import { Card, CardBody, CardTitle, Button } from "reactstrap";
import { NavLink } from "react-router-dom";

const ProtectedIndex = ({ apartments, current_user }) => {
  const myApartments = apartments?.filter(
    (apartment) => current_user.id === apartment.user_id
  );
  return (
    <>
      <h1>My Condo Listings</h1>
      <div className="apartments">
        {apartments?.map((apartment, index) => {
          return (
            <Card
              className="card"
              key={index}
              style={{
                width: "18rem",
              }}
            >
              <img
                className="card"
                alt={apartment.street}
                src={apartment.image}
              />
              <CardBody>
                <CardTitle tag="h5">
                  {apartment.street},{apartment.city}, {apartment.state}
                </CardTitle>
                <Button>
                  <NavLink to={`/apartmentshow/${apartment.id}`}>
                    See More Info
                  </NavLink>
                </Button>
                <Button>
                  <NavLink>Delete</NavLink>
                </Button>
                <Button>
                  <NavLink>Edit</NavLink>
                </Button>
              </CardBody>
            </Card>
          );
        })}
      </div>
    </>
  );
};

export default ProtectedIndex;
