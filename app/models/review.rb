class Review < ActiveRecord::Base
  belongs_to :restaurant
  has_one :picture
  accepts_nested_attributes_for :picture

  def body_sample
    self.body[0..37] + "..."
  end

  def set_pic
    self.picture.url
  end
end
