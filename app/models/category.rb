class Category < ActiveRecord::Base
  has_and_belongs_to_many :restaurants
  belongs_to :picture

  def set_picture
    if self.picture_id.nil?
      Picture.default_pic
    else
      self.picture.url
    end
  end

  def all_pictures
    self.restaurants.map { |rsrnt| rsrnt.all_pictures }.flatten
  end

end
