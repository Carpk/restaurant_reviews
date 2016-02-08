class WelcomeController < ApplicationController

  def index
    @featured_list = Restaurant.last(4)
    @categories = Category.all
    @latest_reviews = Review.last(4)
  end
end
