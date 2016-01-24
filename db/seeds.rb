# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

boys = Area.create(name: "Boystown")
lake = Area.create(name: "Lakeview")
brid = Area.create(name: "Bridgeport")
humb = Area.create(name: "Humboldt Park")
chin = Area.create(name: "Chinatown")

rico = Restaurant.create(name: "Ricobene's", score: 8, area_id: brid.id)
punk = Restaurant.create(name: "Punky's", score: 5, area_id: brid.id)
wing = Restaurant.create(name: "Triple Crown", score: 7, area_id: chin.id)
lock = Restaurant.create(name: "Lockdown", score: 10, area_id: humb.id)
braz = Restaurant.create(name: "Brazilian Bowl Grill", score: 10, area_id: boys.id)
chic = Restaurant.create(name: "Chicken Hut", score: 3, area_id: boys.id)
flub = Restaurant.create(name: "Flub A Dub Chub's", score: 8, area_id: lake.id)

burg = Category.create(set: "Burger")
pizz = Category.create(set: "Pizza")
ital = Category.create(set: "Italian")
cchi = Category.create(set: "Chinese")
brbq = Category.create(set: "BBQ")
cckn = Category.create(set: "Chicken")
sand = Category.create(set: "Sandwich")
soup = Category.create(set: "Soup")
lati = Category.create(set: "Latin")

rico.categories << pizz << sand
punk.categories << pizz << ital
wing.categories << cchi
lock.categories << burg
braz.categories << lati
chic.categories << cckn
flub.categories << burg

List.create(title: "Savory BBQ Joints", description: "")
List.create(title: "Best Pizza", description: "")

Blog.create(title: "Finding great Pizza", description: "")
Blog.create(title: "Hidden Chinese Secrets", description: "Two words: Chinese Bread")

Atmospheres.create(set: "loud")
Atmospheres.create(set: "romantic")
Atmospheres.create(set: "casual")
Atmospheres.create(set: "small")


