class Restaurant < ActiveRecord::Base
  has_many :restaurant_listing
  has_many :lists, through: :restaurant_listing
  has_and_belongs_to_many :categories
  has_many :reviews
  belongs_to :area

  def self.score_avg
    rstrnts_scores = Restaurant.all.map {|r| r.score}

    (rstrnts_scores.reduce(:+).to_f/rstrnts_scores.count).round(1)
  end

  def list_body(id)
    self.restaurant_listing.find {|l| l.list_id == id }.body
  end

  def add_categories(category_ids)
    category_ids.each {|id| self.categories << Category.find(id)}
  end

  def edit_categories(category_ids)
    self.categories.clear
    add_categories(category_ids)
  end

  def picture
    self.reviews.empty? ? Picture.default_pic : self.reviews.sample.picture
  end

  def all_pictures
    self.reviews.map {|review| review.picture}
  end
end
