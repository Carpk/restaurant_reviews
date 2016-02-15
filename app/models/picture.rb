class Picture < ActiveRecord::Base
  belongs_to :review

  def self.default_pic
    Picture.new(url: "/assets/default-3d5292881338b54f6d6b71bab276827a566a8dbfe26c4a493841bedcc793a96f.jpg")
  end
end
