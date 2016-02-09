class Review < ActiveRecord::Base
  belongs_to :restaurant

  def body_sample
    self.body[0..37] + "..."
  end
end
