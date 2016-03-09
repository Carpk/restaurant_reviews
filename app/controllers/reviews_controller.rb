class ReviewsController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :edit]

  def index
    @reviews = Restaurant.find_by_name(params[:restaurant_id]).reviews
  end

  def new
    @review = Review.new(restaurant_id: params[:restaurant_id])
    @review.build_picture
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
    new_review = Review.new(review_params)
    if new_review.save
      redirect_to admin_path(1), :notice => "Review successfully created"
    else
      redirect_to admin_path(1), :alert => "Unable to save review"
    end
  end

  def show
    @review = Review.find_by_title(params[:id])
  end

  def destroy
    Review.find(params[:id]).destroy

    redirect_to admin_restaurant_reviews_path(1, params[:restaurant_id]), :alert => "Review has been deleted"
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :title, :entree,
                   :price, :score, :body, picture_attributes: [:url, :review_id])
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
