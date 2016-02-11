class Review < ActiveRecord::Base
  belongs_to :restaurant

  def body_sample
    self.body[0..37] + "..."
  end

  def picture
    if self.picture_url.nil?
      "/assets/default.jpg"
    else
      self.picture_url
    end
  end
end
