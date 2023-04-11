user1 = User.where(email: 'test@testing.com').first_or_create(password: 'testing123', password_confirmation: 'testing123')
user2 = User.where(email: 'testing@testing.com').first_or_create(password: 'testing123', password_confirmation: 'testing123')

user1_apartments = [{
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
},
{
    street: '759 India St',
    city: 'San Diego',
    state: 'CA',
    manager: 'Den Apartments',
    email: 'apartments@email.com',
    price: '2250000',
    bedrooms: 3,
    bathrooms: 2,
    pets: 'small pets only',
    image: 'https://images.squarespace-cdn.com/content/v1/5c47817996e76f8fca739d4d/1548982984657-Q3FMQC6EK3P4KEIFP7RQ/little-italy-san-diego-apartments-ext_5.jpg'
},
{
    street: '4920 Maine St',
    city: 'La Jolla',
    state: 'CA',
    manager: 'Den Apartments',
    email: 'apartments@email.com',
    price: '5550000',
    bedrooms: 3,
    bathrooms: 2,
    pets: 'small pets only',
    image: 'https://lajolla.com/wp-content/uploads/2022/08/Little-Italy-San-Diego-Luxury-Aparments-The-Lindley.jpg'
}]

user2_apartments = [{
    street: '123 Cinema Ave',
    city: 'Hollywood',
    state: 'CA',
    manager: 'Den Apartments',
    email: 'apartments@email.com',
    price: '3750000',
    bedrooms: 7,
    bathrooms: 9,
    pets: 'yes',
    image: 'https://www.rent.com/blog/wp-content/uploads/2014/07/The-Top-10-Most-Baller-Amenities-at-Luxury-Apartments-Movie-Theater.jpg'
},
{
    street: '96 Fifth Ave',
    city: 'New York City',
    state: 'NY',
    manager: 'Den Apartments',
    email: 'apartments@email.com',
    price: '8000000',
    bedrooms: 2,
    bathrooms: 1,
    pets: 'no',
    image: 'https://bloximages.newyork1.vip.townnews.com/sandiegomagazine.com/content/tncms/assets/v3/editorial/9/49/9490535c-4f06-11ed-8e5c-e3724194f96e/634edc07e224e.image.jpg?resize=668%2C500'
},
{
    street: '937 Townhouse Rd',
    city: 'Richmond',
    state: 'VA',
    manager: 'Den Apartments',
    email: 'apartments@email.com',
    price: '220000',
    bedrooms: 5,
    bathrooms: 4,
    pets: 'yes',
    image: 'https://palisadeutc.com/assets/images/cache/GS_UTC_Palisade_CH_Library-resize1-99e8ed6ddd361f45ecd2866f1654ced0.jpg'
}]

user1_apartments.each do |apartment|
    user1.apartments.create(apartment)
    p "created: #{apartment}"
end

user2_apartments.each do |apartment|
    user2.apartments.create(apartment)
    p "created: #{apartment}"
end