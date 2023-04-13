import React from "react";
import { UncontrolledCarousel } from "reactstrap";
const Home = () => {
  return (
    <div className='content'>
      <div className="greeting">
        <h1>Welcome to Big Ballerz Condos!</h1>
      </div>
      <UncontrolledCarousel
        className="front_page_carousel"
        items={[
          {
            caption: "New York Flats ",
            key: 1,
            src: "https://images.unsplash.com/photo-1507149833265-60c372daea22?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80",
          },
          {
            caption: "Luxurious California Condos",
            key: 2,
            src: "https://images.unsplash.com/photo-1512914890251-2f96a9b0bbe2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
          },
          {
            caption: "Simple Spacious Studios ",
            key: 3,
            src: "https://plus.unsplash.com/premium_photo-1661721905869-03b9aacd68a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
          },
        ]}
      />

      <p>
        Welcome to our exclusive luxury condo and apartment website, designed
        for those who demand the very best in high-end living. Our properties
        cater to an elite clientele who value luxury, privacy, and convenience.
      </p>
      <p>
        As you browse our website, you'll discover a stunning selection of
        upscale condos and apartments, each carefully crafted with the finest
        materials and finishes. From breathtaking views of the city skyline to
        private terraces and outdoor spaces, our properties offer the ultimate
        in luxury living.
      </p>
      <p>
        At our luxury condo and apartment website, we pride ourselves on
        offering a seamless and personalized experience. Our team of expert real
        estate professionals is available around the clock to assist with all
        your needs, from property tours to lease negotiations.
      </p>
      <p>
        Discover the pinnacle of luxury living with our exclusive collection of
        high-end condos and apartments. Explore our website today and start
        living your best life.
      </p>
    </div>
  );
};

export default Home;
