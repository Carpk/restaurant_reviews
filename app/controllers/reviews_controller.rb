class ReviewsController < ApplicationController

  def show
    @review = Review.find_by_title(params[:id])
  end
end
