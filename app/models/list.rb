class List < ActiveRecord::Base
  has_many :review_listing
  has_many :restaurant_listing
  has_many :reviews, :through => :review_listing
  has_many :restaurants, through: :restaurant_listing
end
