class Picture < ActiveRecord::Base
  belongs_to :review

  def self.default_pic
    "/assets/default.jpg"
  end
end
