class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @hash = Gmaps4rails.build_markers(@restaurants) do |store, marker|
      marker.lat store.latitude
      marker.lng store.longitude
    end
  end

  def show
    @restaurant = Restaurant.find_by_name(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @category   = Category.new
    @categories = Category.all
  end

  def edit
    @restaurant = Restaurant.find_by_name(params[:id])
    @categories = Category.all
  end

  def create
    rstrnt = Restaurant.create(restaurant_params)
    rstrnt.add_categories(params[:category_ids])

    redirect_to admin_path(1)
  end

  def update
    restaurant = Restaurant.find_by_name(params[:id])
    restaurant.update(restaurant_params)
    restaurant.edit_categories(params[:category_ids])

    redirect_to admin_path(1)
  end

  def destroy
    Restaurant.find(params[:id]).destroy

    redirect_to admin_path(1)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :score, :body, :latitude, :longitude)
  end
end
