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
  end

  def edit
    @restaurant = Restaurant.find_by_name(params[:id])
  end

  def create
    Restaurant.create(restaurant_params)

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
