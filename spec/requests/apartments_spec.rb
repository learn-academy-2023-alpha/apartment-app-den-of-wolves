require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let (:user) {User.create email: "test@testing.com", password: "test123", password_confirmation: "test123"}
  describe "GET /index" do
    it "gets a list of apartments" do 
    user.apartments.create(
            street: '123 Fourth St',
            city: 'San Diego',
            state: 'CA',
            manager: 'Den Apartments',
            email: 'apartments@email.com',
            price: '1500000',
            bedrooms: 4,
            bathrooms: 4,
            pets: 'yes',
            image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg'
    )
      get "/apartments"
      apartment= JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.length).to eq 1
    end
  end
end