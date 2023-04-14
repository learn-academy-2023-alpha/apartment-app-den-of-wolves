import React, {useState} from 'react'
import { useNavigate } from 'react-router-dom'
import { Form, FormGroup, Input, Label, Button } from 'reactstrap'

const ApartmentNew = ({current_user, createApartment}) => {
  const navigate = useNavigate()

  const [myApartment, setMyApartment] = useState({
    street: "",
    city: "",
    state: "",
    manager: "",
    email: "",
    price: "",
    bedrooms: "",
    bathrooms: "",
    pets: "",
    image: "",
    user_id: current_user?.id
})

const handleChange = (e) => {
  setMyApartment({...myApartment, [e.target.name]: e.target.value})
}

const handleSubmit = () => {
  createApartment(myApartment)
  navigate("/apartmentindex")
}

  return (
    <div className='content'>
      <h1>Create a New Listing</h1>
      <Form>
        <FormGroup>
          <Label for="street">
          Street
          </Label>
          <Input
          id="street"
          name="street"
          placeholder="What is the street?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
        <FormGroup>
          <Label for="city">
          City
          </Label>
          <Input
          id="city"
          name="city"
          placeholder="What is the city?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
        <FormGroup>
          <Label for="state">
          Street
          </Label>
          <Input
          id="state"
          name="state"
          placeholder="What is the state?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
        <FormGroup>
          <Label for="manager">
          Manager
          </Label>
          <Input
          id="manager"
          name="manager"
          placeholder="What is the manager?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
        <FormGroup>
          <Label for="email">
          Email
          </Label>
          <Input
          id="email"
          name="email"
          placeholder="What is the email?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
        <FormGroup>
          <Label for="price">
          Price
          </Label>
          <Input
          id="price"
          name="price"
          placeholder="What is the price?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
        <FormGroup>
          <Label for="bedrooms">
          Bedrooms
          </Label>
          <Input
          id="bedrooms"
          name="bedrooms"
          placeholder="How many bedrooms?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
      <FormGroup>
          <Label for="bathrooms">
          Bathrooms
          </Label>
          <Input
          id="bathrooms"
          name="bathrooms"
          placeholder="How many bathrooms?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
      <FormGroup>
          <Label for="pets">
          Pets
          </Label>
          <Input
          id="pets"
          name="pets"
          placeholder="Are pets allowed?"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
      <FormGroup>
          <Label for="image">
          Image
          </Label>
          <Input
          id="image"
          name="image"
          placeholder="Image URL here"
          type="text"
          onChange={handleChange}
          />
      </FormGroup>
      <Button onClick={handleSubmit}>
        Create Listimg
      </Button>
      </Form>
    </div>
  )
}

export default ApartmentNew