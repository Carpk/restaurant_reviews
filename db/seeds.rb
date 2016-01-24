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

rico = Restaurant.create(name: "Ricobene's", score: 8, area_id: brid.id)
punk = Restaurant.create(name: "Punky's", score: 5, area_id: brid.id)
wing = Restaurant.create(name: "Wing Yip Chop", score: 4, area_id: brid.id)
lock = Restaurant.create(name: "Lockdown", score: 10, area_id: humb.id)
braz = Restaurant.create(name: "Brazilian Bowl Grill", score: 10, area_id: boys.id)
chic = Restaurant.create(name: "Chicken Hut", score: 3, area_id: boys.id)
flub = Restaurant.create(name: "Flub A Dub Chub's", score: 8, area_id: lake.id)

Category.create(set: "Burger")
Category.create(set: "Pizza")
Category.create(set: "Italian")
Category.create(set: "Chinese")
Category.create(set: "BBQ")
Category.create(set: "Chicken")

List.create(title: "Savory BBQ Joints", description: "")
List.create(title: "Best Pizza", description: "")

Blog.create(title: "Finding great Pizza", description: "")
Blog.create(title: "Hidden Chinese Secrets", description: "Two words: Chinese Bread")

Atmospheres.create(set: "loud")
Atmospheres.create(set: "romantic")
Atmospheres.create(set: "casual")
Atmospheres.create(set: "small")


