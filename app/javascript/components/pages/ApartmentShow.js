import React, { useState } from 'react'
import {
  NavLink,
  Carousel,
  CarouselItem,
  CarouselControl,
  CarouselIndicators,
  CarouselCaption,
  Button,
} from 'reactstrap'
import { useNavigate, useParams } from 'react-router-dom'

const ApartmentShow = ({ apartments }) => {
  const navigate = useNavigate()
  let { id } = useParams()

  if (-1 === apartments?.find((apartment) => apartment.id === +id)) {
    navigate("/not_found")
  }

  const [currentApartment, setCurrentApartment] = useState(
    apartments?.find((apartment) => apartment.id === +id)
  )
  const [activeIndex, setActiveIndex] = useState(
    apartments?.findIndex((apartment) => apartment.id === +id)
  )
  const [animating, setAnimating] = useState(false)

  const next = () => {
    if (animating) return
    const nextIndex =
      activeIndex === apartments.length - 1 ? 0 : activeIndex + 1
    setActiveIndex(nextIndex)
    setCurrentApartment(apartments[nextIndex])
  }

  const previous = () => {
    if (animating) return
    const nextIndex = activeIndex === 0 ? apartments.length - 1 : activeIndex - 1
    setActiveIndex(nextIndex)
    setCurrentApartment(apartments[nextIndex])
  }

  const goToIndex = (newIndex) => {
    if (animating) return
    setActiveIndex(newIndex)
    setCurrentApartment(apartments[newIndex])
  }

  const slides = apartments?.map((apartment) => {
    return (
      <CarouselItem
        onExiting={() => setAnimating(true)}
        onExited={() => setAnimating(false)}
        key={apartment.id}
      >
        <img class="img-fluid" src={apartment.image} alt={apartment.street} />
        <CarouselCaption
          captionHeader={`${apartment.street} ${apartment.city}, ${apartment.state}`}
          captionText={`$${apartment.price}`}
        />
      </CarouselItem>
    )
  })

  return (
    <div className="content">
      <Carousel
        className="showCarousel"
        activeIndex={activeIndex}
        next={next}
        previous={previous}
        interval={false}
      >
        <CarouselIndicators
          items={apartments}
          activeIndex={activeIndex}
          onClickHandler={goToIndex}
        />
        {slides}
        <CarouselControl
          direction="prev"
          directionText="Previous"
          onClickHandler={previous}
        />
        <CarouselControl
          direction="next"
          directionText="Next"
          onClickHandler={next}
        />
      </Carousel>
      <div className="description">
        <ul>
          <li>
            Address: {currentApartment.street}, {currentApartment.city},{" "}
            {currentApartment.state}
          </li>
          <li>Manager: {currentApartment.manager} </li>
          <li>Email: {currentApartment.email} </li>
          <li>Price: ${currentApartment.price}</li>
          <li>Bedrooms: {currentApartment.bedrooms}</li>
          <li>Bathrooms: {currentApartment.bathroom}</li>
          <li>Pets: {currentApartment.pets}</li>
        </ul>
      </div>

      <a href="/apartmentindex">Back to all apartments</a>
    </div>
  )
}
