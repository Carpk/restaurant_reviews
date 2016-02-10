class Review < ActiveRecord::Base
  belongs_to :restaurant
  has_one :picture

  def body_sample
    self.body[0..37] + "..."
  end

  def pic_url
    if self.picture.nil?
      "http://wholesomehealthng.com/wp-content/uploads/2015/12/271626-fast-food.jpg"
    else
      self.picture.address
    end
  end
end
