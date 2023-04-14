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

  describe 'POST /create' do
    it 'creates an apartment' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(200)

      # Why does Apartment.first work, but Apartment.last fail?
      apartment = Apartment.first

      expect(apartment.street).to eq '123 Fourth St'
      expect(apartment.city).to eq 'San Diego'
      expect(apartment.state).to eq 'CA'
      expect(apartment.manager).to eq 'Den Apartments'
      expect(apartment.email).to eq 'apartments@email.com'
      expect(apartment.price).to eq '1500000'
      expect(apartment.bedrooms).to eq 4
      expect(apartment.bathrooms).to eq 4
      expect(apartment.pets).to eq 'yes'
      expect(apartment.image).to eq 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg'
    end

    it 'does not create an apartment without a street' do
      apartment_params = {
        apartment: {
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['street']).to include "can't be blank"
    end

    it 'does not create an apartment without a city' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['city']).to include "can't be blank"
    end

    it 'does not create an apartment without a state' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['state']).to include "can't be blank"
    end

    it 'does not create an apartment without a manager' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['manager']).to include "can't be blank"
    end

    it 'does not create an apartment without an email' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['email']).to include "can't be blank"
    end

    it 'does not create an apartment without a price' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['price']).to include "can't be blank"
    end

    it 'does not create an apartment without bedrooms' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['bedrooms']).to include "can't be blank"
    end

    it 'does not create an apartment without bathrooms' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['bathrooms']).to include "can't be blank"
    end

    it 'does not create an apartment without pets' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['pets']).to include "can't be blank"
    end

    it 'does not create an apartment without an image' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end

    it 'does not create an apartment without a user id' do
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
        }
      }

      post '/apartments', params: apartment_params

      expect(response).to have_http_status(422)
      json = JSON.parse(response.body)
      expect(json['user_id']).to include "can't be blank"
    end
  end
  
  describe 'POST / update' do
    it 'requires valid data to update' do
      # Create valid entry
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      apartment = Apartment.first

      # Fail attempt to push bad data to the model
      bad_params = {
        apartment: {
          street: nil,
          city: nil,
          state: nil,
          manager: nil,
          email: nil,
          price: nil,
          bedrooms: nil,
          bathrooms: nil,
          pets: nil,
          image: nil,
          user_id: nil
        }
      }

      patch "/apartments/#{apartment.id}", params: bad_params

      expect(response).to have_http_status(422)

      json = JSON.parse(response.body)

      expect(json['street']).to include "can't be blank"
      expect(json['city']).to include "can't be blank"
      expect(json['state']).to include "can't be blank"
      expect(json['manager']).to include "can't be blank"
      expect(json['email']).to include "can't be blank"
      expect(json['price']).to include "can't be blank"
      expect(json['bedrooms']).to include "can't be blank"
      expect(json['bathrooms']).to include "can't be blank"
      expect(json['pets']).to include "can't be blank"
      expect(json['image']).to include "can't be blank"
      expect(json['user_id']).to include "can't be blank"
    end
  end

  describe 'DESTROY / delete' do
    it 'requires valid entry to delete' do
      # Create valid entry
      apartment_params = {
        apartment: {
          street: '123 Fourth St',
          city: 'San Diego',
          state: 'CA',
          manager: 'Den Apartments',
          email: 'apartments@email.com',
          price: '1500000',
          bedrooms: 4,
          bathrooms: 4,
          pets: 'yes',
          image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg',
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      apartment = Apartment.first

      delete "/apartments/#{apartment.id}"

      expect(response).to have_http_status(200)

      expect { Apartment.find(apartment.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end