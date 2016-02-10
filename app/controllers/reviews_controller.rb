class ReviewsController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index
    @reviews = Restaurant.find_by_name(params[:restaurant_id]).reviews
  end

  def new
    @review = Review.new(restaurant_id: params[:restaurant_id])

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

    redirect_to admin_path(1)
  end

  def show
    @review = Review.find_by_title(params[:id])
  end


  private

  def review_params
    params.require(:review).permit(:restaurant_id, :title, :entree, :price, :score, :body)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
