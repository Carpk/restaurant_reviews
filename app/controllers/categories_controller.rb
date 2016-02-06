class CategoriesController < ApplicationController

  def show
    @restaurants = Category.find_by_set(params[:id]).restaurants
  end

  def create
    Category.create(set: params[:category])

    redirect_to admin_path(1)
  end

  private

  # def category_params
  #   params.require(:category).permit(:set)
  # end
end
