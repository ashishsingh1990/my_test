# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "ashish", email: "ashish@gmail.com", password: "asd@123", password_confirmation: "asd@123", role: "expert")
User.create(username: "naveen", email: "naveen@gmail.com", password: "asd@123", password_confirmation: "asd@123", role: "novice")
