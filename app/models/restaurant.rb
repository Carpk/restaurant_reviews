class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :reviews
  belongs_to :area

  def self.score_avg
    rstrnts = Restaurant.all
    total = 0

    rstrnts.each {|rstrnt| total += rstrnt.score}
    (total.to_f/rstrnts.count).round(1)
  end

  def add_categories(category_ids)
    category_ids.each {|id| self.categories << Category.find(id)}
  end

  def edit_categories(category_ids)
    self.categories.clear
    add_categories(category_ids)
  end

  def picture
    unless self.reviews.empty?
      self.reviews.first.picture
    else
      "/assets/default.jpg"
    end
  end
end
