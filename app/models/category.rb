class Category < ActiveRecord::Base
  has_and_belongs_to_many :restaurants
  belongs_to :picture

  def set_picture
    if self.picture_id.nil?
      "/assets/default.jpg"
    else
      self.picture.url
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
