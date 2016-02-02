class ReviewsController < ApplicationController

  def index
    @reviews = Restaurant.find_by_name(params[:restaurant_id]).reviews
  end

  def show
    @review = Review.find_by_title(params[:id])
  end
end
