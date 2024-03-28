# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seed for amenities
Amenitie.create(label: "Television")
Amenitie.create(label: "Wifi")
Amenitie.create(label: "King-size bed")
Amenitie.create(label: "Balcony")
Amenitie.create(label: "Air conditioning")
Amenitie.create(label: "Bath")
Amenitie.create(label: "Kitchen")
Amenitie.create(label: "Elevator")
Amenitie.create(label: "Washing machine")
Amenitie.create(label: "Dryer")
Amenitie.create(label: "Hairdryer")

# # seed for user
User.create(email: "toto1@ieseg.fr", password: "supermotdepasse", legal_name: "user test")

# seed for flats
Flat.create(user_id: 1, city: "Paris", country: "France", zipcode: "75012", title: "Beautiful place to spend some days in Paris", price_per_night: 250, free_cancellation: false, homepagetitle: "Merlimont, France")
Flat.create(user_id: 1, city: "Paris", country: "France", zipcode: "75001", title: "Small appartment in the center of Paris", price_per_night: 150, free_cancellation: false, homepagetitle: "Merlimont, France")
Flat.create(user_id: 1, city: "Courbevoie", country: "France", zipcode: "92400", title: "Big house for group close to La Défense", price_per_night: 399.99, free_cancellation: true, homepagetitle: "Merlimont, France")
Flat.create(user_id: 1, city: "Paris", country: "France", zipcode: "75008", title: "Amazing appartment with view on the Eiffel Tower", price_per_night: 500, free_cancellation: false, homepagetitle: "Merlimont, France")
