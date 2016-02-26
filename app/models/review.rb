class Review < ActiveRecord::Base
  has_and_belongs_to_many :lists
  belongs_to :restaurant
  has_one :picture
  accepts_nested_attributes_for :picture

  def body_sample
    self.body[0..37]
  end
end
