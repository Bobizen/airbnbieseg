# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

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
User.create(email: "user11@ieseg.fr", password: "mbamba", legal_name: "user test")
User.create(email: "user22@ieseg.fr", password: "mbamba", legal_name: "Oli Wander")

# seed for flats
flat1 = Flat.create(user_id: 1, city: "Paris", country: "France", zipcode: "75012", title: "Beautiful place to spend some days in Paris", price_per_night: 250, free_cancellation: false, homepagetitle: "Merlimont, France")
file1 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711671972/development/zlaeyvbdyzrb5215wtl10i50bw2l.webp')
flat1.photos.attach(io: file1, filename: 'image1.webp', content_type: 'image/webp')

flat2 = Flat.create(user_id: 1, city: "Paris", country: "France", zipcode: "75001", title: "Small appartment in the center of Paris", price_per_night: 150, free_cancellation: false, homepagetitle: "Merlimont, France")
file2 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711641235/development/z8hpr7og8ned1glnvb3ony7mey9r.webp')
flat2.photos.attach(io: file2, filename: 'image2.webp', content_type: 'image/webp')
file3 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711641233/development/tpkg2yo0f2n2rdvkc2qp2v6w9p6n.webp')
flat2.photos.attach(io: file3, filename: 'image3.webp', content_type: 'image/webp')

flat3 = Flat.create(user_id: 2, city: "Courbevoie", country: "France", zipcode: "92400", title: "Big house for group close to La Défense", price_per_night: 399.99, free_cancellation: true, homepagetitle: "Merlimont, France")
file4 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711639957/development/bu8pzuez0kcojunots2c7vjexk1n.webp')
flat3.photos.attach(io: file4, filename: 'image4.webp', content_type: 'image/webp')
file5 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711553992/development/k91s3p9gxy9pprvgrn8saf5rodoz.jpg')
flat3.photos.attach(io: file5, filename: 'image5.jpg', content_type: 'image/jpg')
file6 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711639957/development/bu8pzuez0kcojunots2c7vjexk1n.webp')
flat3.photos.attach(io: file6, filename: 'image6.webp', content_type: 'image/webp')

flat4 = Flat.create(user_id: 2, city: "Paris", country: "France", zipcode: "75008", title: "Amazing appartment with view on the Eiffel Tower", price_per_night: 500, free_cancellation: false, homepagetitle: "Merlimont, France")
file7 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711639957/development/bu8pzuez0kcojunots2c7vjexk1n.webp')
flat4.photos.attach(io: file7, filename: 'image7.webp', content_type: 'image/webp')
file8 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711553992/development/k91s3p9gxy9pprvgrn8saf5rodoz.jpg')
flat4.photos.attach(io: file8, filename: 'image8.jpg', content_type: 'image/jpg')
file9 = URI.open('https://res.cloudinary.com/dq6q7camh/image/upload/v1711639957/development/bu8pzuez0kcojunots2c7vjexk1n.webp')
flat4.photos.attach(io: file9, filename: 'image9.webp', content_type: 'image/webp')
# flat4.photos.attach(io: File.open(Rails.root.join('/assets/images/image2.jpeg')), filename: 'image2.jpeg')
# flat4.photos.attach(io: File.open(Rails.root.join('/assets/images/image7.jpeg')), filename: 'image7.jpeg')
# flat4.photos.attach(io: File.open(Rails.root.join('/assets/images/image1.jpeg')), filename: 'image1.jpeg')
# flat4.photos.attach(io: File.open(Rails.root.join('/assets/images/image8.jpeg')), filename: 'image8.jpeg')

# attach images to flats
# Flat.find(2).photos.attach(io: File.open(Rails.root.join('assets/images/image3.jpeg')), filename: 'image3.jpeg')
# Flat.find(2).photos.attach(io: File.open(Rails.root.join('assets/images/image4.jpeg')), filename: 'image4.jpeg')
# Flat.find(3).photos.attach(io: File.open(Rails.root.join('assets/images/image5.jpeg')), filename: 'image5.jpeg')
# Flat.find(3).photos.attach(io: File.open(Rails.root.join('assets/images/image6.webp')), filename: 'image6.webp')
