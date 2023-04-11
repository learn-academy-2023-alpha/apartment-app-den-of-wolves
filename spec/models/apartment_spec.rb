require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let (:user) {User.create email: 'tammy@testing.com', password: 'test123', password_confirmation: 'test123'}

  it 'should be valid with valid data' do 
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors).to be_empty
  end

  it 'should validate street' do
    apartment = user.apartments.create(city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:street]).to include "can't be blank"
  end

  it 'should validate city' do
    apartment = user.apartments.create(street: '123 Fourth St', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:city]).to include "can't be blank"
  end

  it 'should validate state' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:state]).to include "can't be blank"
  end

  it 'should validate manager' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:manager]).to include "can't be blank"
  end

  it 'should validate email' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:email]).to include "can't be blank"
  end

  it 'should validate price' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:price]).to include "can't be blank"
  end

  it 'should validate bedrooms' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:bedrooms]).to include "can't be blank"
  end

  it 'should validate bathrooms' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:bathrooms]).to include "can't be blank"
  end

  it 'should validate pets' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:pets]).to include "can't be blank"
  end

  it 'should validate image' do
    apartment = user.apartments.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes')
    expect(apartment.errors[:image]).to include "can't be blank"
  end

  it 'should validate a user_id' do 
    apartment = Apartment.create(street: '123 Fourth St', city: 'San Diego', state: 'CA', manager: 'Den Apartments', email: 'apartments@email.com', price: '1500000', bedrooms: 4, bathrooms: 4, pets: 'yes', image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982975169-Y4J3Z5XQ7ZPHVEZ1P90J/little-italy-san-diego-apartments-493.016.jpg')
    expect(apartment.errors[:user_id]).to include "can't be blank"
  end

end
