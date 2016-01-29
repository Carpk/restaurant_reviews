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
end
