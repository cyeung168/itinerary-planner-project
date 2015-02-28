# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Destination.destroy_all
Itinerary.destroy_all

joel = User.create(user_name:"JShananana", password:"12345", email:"JShananana@LOL.com", first_name:"Joel", last_name:"Shooster")
cynthia = User.create(user_name:"CYeung", password:"56789", email:"CYeung123@aol.com", first_name:"Cynthia", last_name:"Yeung")
christine = User.create(user_name:"CLau", password:"54321", email:"CLau@gmail.com", first_name:"Christine", last_name:"Lau")

ga = Destination.create(location:"225 Bush St", name:"General Assembly", info:"Most awesome bootcamp ever")
sf = Destination.create(location:"San Francisco, California, USA", name:"San Francisco", info:"Greatest city on the face of the Earth")
la = Destination.create(location:"Los Angeles, California, USA", name:"Los Angeles", info:"Okay but not as good as San Francisco")

trip1 = Itinerary.create(origin:2, destination:3, name:"Fun trip")