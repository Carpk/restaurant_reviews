class CategoriesController < ApplicationController

  def show
    @restaurants = Category.find_by_name(params[:id]).restaurants
  end

  def index
    @categories = Category.all
    @new_category = Category.new
  end

  def create
    Category.create(category_params)

    redirect_to admin_path(1)
  end

  def destroy
    Category.find(params[:id]).destroy

    redirect_to admin_path(1)
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
