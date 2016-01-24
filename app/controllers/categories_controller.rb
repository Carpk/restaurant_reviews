class CategoriesController < ApplicationController

  def show
    @restaurants = Category.find_by_set(params[:id]).restaurants
  end
end
