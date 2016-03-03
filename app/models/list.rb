class List < ActiveRecord::Base
  has_and_belongs_to_many :reviews
  has_and_belongs_to_many :restaurants

  def listed_items
    self.reviews.empty? ? self.restaurants : self.reviews
  end
end
