class CategoriesController < ApplicationController

  def show
    @restaurants = Category.find_by_name(params[:id]).restaurants
  end

  def index
    @categories = Category.all
    @new_category = Category.new
  end

  def edit
    @category = Category.find_by_name(params[:id])
  end

  def update
    category = Category.find_by_name(params[:id])
    category.update(category_params)

    redirect_to admin_categories_path(1)
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
    params.require(:category).permit(:name, :description, :picture_id)
  end
end
