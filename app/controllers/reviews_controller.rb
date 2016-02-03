class ReviewsController < ApplicationController

  def index
    @reviews = Restaurant.find_by_name(params[:restaurant_id]).reviews
  end

  def new
    @review = Review.new(restaurant_id: params[:restaurant_id])
  end

  def show
    @review = Review.find_by_title(params[:id])
  end
end
