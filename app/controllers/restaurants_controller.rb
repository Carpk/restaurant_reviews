class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @hash = Gmaps4rails.build_markers(@restaurants) do |rstrnt, marker|
      marker.lat rstrnt.latitude
      marker.lng rstrnt.longitude
      marker.title rstrnt.name
      marker.infowindow render_to_string(:partial => "/layouts/infowindow", :locals => { :object => rstrnt})
      marker.json({ :id => rstrnt.id })
    end
  end

  def show
    @restaurant = Restaurant.find_by_name(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    @categories = Category.all
  end

  def edit
    @restaurant = Restaurant.find_by_name(params[:id])
    @categories = Category.all
  end

  def create
    rstrnt = Restaurant.create(restaurant_params)
    rstrnt.add_categories(params[:category_ids])

    redirect_to admin_path(1), :notice => "A new restaurant has been created"
  end

  def update
    restaurant = Restaurant.find_by_name(params[:id])
    restaurant.update(restaurant_params)
    restaurant.edit_categories(params[:category_ids])

    redirect_to admin_path(1)
  end

  def destroy
    Restaurant.find(params[:id]).destroy

    redirect_to admin_path(1), :alert => "Restaurant has been deleted"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :score, :body, :expense, :latitude, :longitude)
  end
end
