class List < ActiveRecord::Base
  has_many :review_listing
  has_many :restaurant_listing
  has_many :reviews, :through => :review_listing
  has_many :restaurants, through: :restaurant_listing

 # def listed_items
  #  self.reviews.empty? ? self.restaurants : self.reviews
  #end
end
