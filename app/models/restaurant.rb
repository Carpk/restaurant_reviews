class Restaurant < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :reviews

  def add_categories(category_ids)
    category_ids.each {|id| self.categories << Category.find(id)}
  end

  def edit_categories(category_ids)
    self.categories.clear
    add_categories(category_ids)
  end

  def self.score_avg
    total = 0
    rstrnts = Restaurant.all

    rstrnts.each {|rstrnt| total += rstrnt.score}
    (total.to_f/rstrnts.count).round(1)
  end
end
