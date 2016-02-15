class Category < ActiveRecord::Base
  has_and_belongs_to_many :restaurants
  belongs_to :picture

  def picture
    super || Picture.default_pic
  end

  def all_pictures
    self.restaurants.map { |rsrnt| rsrnt.all_pictures }.flatten
  end
end
