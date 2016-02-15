class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :reviews
  belongs_to :area

  def self.score_avg
    rstrnts = Restaurant.all.map {|r| r.score}

    (rstrnts.reduce(:+).to_f/rstrnts.count).round(1)
  end

  def add_categories(category_ids)
    category_ids.each {|id| self.categories << Category.find(id)}
  end

  def edit_categories(category_ids)
    self.categories.clear
    add_categories(category_ids)
  end

  def picture
    if self.reviews.empty?
      Picture.default_pic
    else
      self.reviews.sample.picture
    end
  end

  def all_pictures
    self.reviews.map {|review| review.picture}
  end
end
