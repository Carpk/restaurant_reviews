class Category < ActiveRecord::Base
  has_and_belongs_to_many :restaurants

  def picture
    unless self.restaurants.empty?
      self.restaurants.first.picture
    else
      "/assets/default.jpg"
    end
  end

  def all_pictures
    all = []
    self.restaurants.each do |rsrnt|
      rsrnt.reviews.each do |review|
        all << review.picture
      end
    end
    all
  end

end
