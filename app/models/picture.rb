class Picture < ActiveRecord::Base
  belongs_to :review

  def picture
    if self.address.nil?
      "http://wholesomehealthng.com/wp-content/uploads/2015/12/271626-fast-food.jpg"
    else
      self.address
    end
  end
end
