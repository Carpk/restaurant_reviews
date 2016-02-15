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

rico = Restaurant.create(name: "Ricobene's", score: 8, latitude: 41.84573199089699,
                         longitude: -87.63384103775024, expense: 1, area_id: brid.id)
punk = Restaurant.create(name: "Punky's", score: 5, latitude: 41.84526843,
                         longitude: -87.64181256, expense: 1, area_id: brid.id)
wing = Restaurant.create(name: "Triple Crown", score: 7, latitude: 41.85242126,
                         longitude: -87.63179183, expense: 1, area_id: chin.id)
lock = Restaurant.create(name: "Lockdown", score: 10, latitude: 41.9001576,
                         longitude: -87.687336, expense: 1, area_id: humb.id)
braz = Restaurant.create(name: "Brazilian Bowl Grill", score: 10, latitude: 41.94027581,
                         longitude: -87.64464498, expense: 2, area_id: boys.id)
chkh = Restaurant.create(name: "Chicken Hut", score: 3, latitude: 41.94017605,
                         longitude: -87.64460474, expense: 1, area_id: boys.id)
flub = Restaurant.create(name: "Flub A Dub Chub's", score: 8, latitude: 41.93718427,
                         longitude: -87.64414206, expense: 1, area_id: lake.id)

burg = Category.create(name: "Burger")
pizz = Category.create(name: "Pizza")
ital = Category.create(name: "Italian")
cchi = Category.create(name: "Chinese")
brbq = Category.create(name: "BBQ")
chic = Category.create(name: "Chicken")
sand = Category.create(name: "Sandwich")
soup = Category.create(name: "Soup")
lati = Category.create(name: "Latin")

rico.categories << pizz << sand
punk.categories << pizz << ital
wing.categories << cchi
lock.categories << burg
braz.categories << lati
chkh.categories << chic
flub.categories << burg


Blog.create(title: "Finding great Pizza", description: "")
Blog.create(title: "Hidden Chinese Secrets", description: "Two words: Chinese Bread")

Atmospheres.create(name: "loud")
Atmospheres.create(name: "romantic")
Atmospheres.create(name: "casual")
Atmospheres.create(name: "small")

List.create(title: "Awesome burgers", body: "Our list of epic burgers!").restaurants << lock << punk
List.create(title: "Savory BBQ Joints", body: "Tasty BBQ").restaurants << wing
List.create(title: "Best Pizza", body: "Hell yeah! Pizza").restaurants << rico

punkr = Review.create(restaurant: punk, title: "Bubba burgers",
              entree: "Double Cheeseburger", price: "12", score: "6",
              body: "Burger was a pretty much a Bubba burger that you
              would buy from the frozen food section of your local
              grocery store. I rated it a 6, as I still enjoyed the
              dining experience.")

lockr = Review.create(restaurant: lock, title: "Damn good burger",
              entree: "Habanero Burger", price: "8", score: "10",
              body: "Very good burger made with quality beef. The
              spice on the burger was a bit overwhelming at first,
              however I continued consumption and was very satisfied.")

wingr = Review.create(restaurant: wing, title: "Triple Crown",
              entree: "Dim Sum", price: "4", score: "6",
              body: "Dim Sum was very good. Cheap, you can keep ordering
              them and trying different varieties.")

Picture.create(review_id: wingr.id,
               url: "https://chicagolunchbox.s3-us-west-2.amazonaws.com/uploads/91fa2159-597e-4f76-83d7-fca0b7ae53c9/dimsum.jpg")

Picture.create(review_id: punkr.id,
               url: "https://chicagolunchbox.s3-us-west-2.amazonaws.com/uploads/976c942d-4efb-48c9-a545-acefa7982c91/punky_burger.jpg")

Picture.create(review_id: lockr.id,
               url: "http://s3-media3.fl.yelpcdn.com/bphoto/WBYXO2VLeDNorHOH1tbnAA/o.jpg")
