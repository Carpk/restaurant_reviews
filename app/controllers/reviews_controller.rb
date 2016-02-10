class ReviewsController < ApplicationController

  def index
    @reviews = Restaurant.find_by_name(params[:restaurant_id]).reviews
  end

  def new
    @review = Review.new(restaurant_id: params[:restaurant_id])
    @review.picture.success_action_redirect = new_admin_restaurant_review_url(1, params[:restaurant_id])
  end

  def edit
    @review = Review.find_by_title(params[:id])
  end

  def update
    review = Review.find_by_title(params[:id])
    review.update(review_params)

    redirect_to admin_path(1)
  end

  def create
    Review.create(review_params)

    # redirect_to new_admin_restaurant_review_picture_path(1, review.restaurant.name, review.title)
    redirect_to admin_path(1)
  end

  def show
    @review = Review.find_by_title(params[:id])
  end


  private

  def review_params
    params.require(:review).permit(:restaurant_id, :title, :entree, :price, :score, :body)
  end
end
