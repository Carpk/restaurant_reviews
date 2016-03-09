class Review < ActiveRecord::Base
  has_many :review_listing
  has_many :lists, :through => :reviews_listing
  belongs_to :restaurant
  has_one :picture
  accepts_nested_attributes_for :picture

  def body_sample
    self.body[0..37]
  end
end
