# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new(email: "moocktheloutre@gmail.com", password: "testtest", password_confirmation: "testtest", first_name: "Moock", last_name: "Laloutre")
user.save
user = User.new(email: "emilywithabutton@gmail.com", password: "testtest", password_confirmation: "testtest", first_name: "Emily", last_name: "Button")
user.save
user = User.new(email: "bibiking@hotmail.com", password: "testtest", password_confirmation: "testtest", first_name: "Bibi", last_name: "King")
user.save

flat = Flat.new(address: "7 rue des moines", city: "Paris", title: "Superbe appartement de 35 m2 à Paris", description: "2 pièces à Montmartre", user_id: 1)
flat.save
flat = Flat.new(address: "27 rue de Pontoise", city: "Paris", title: "Superbe appartement de 125 m2 à Paris", description: "5 pièces en plein centre de Paris", user_id: 1)
flat.save
flat = Flat.new(address: "39 quai des Minimes", city: "Bordeaux", title: "Maison de 200 m2 sur les quais de Bordeaux", description: "Maison des 6 pièces avec piscine à Bordeaux", user_id: 3)
flat.save