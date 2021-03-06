class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @restaurants = Restaurant.all.sort_by{|r| r.name}
    @reviews = Review.all.sort_by{|r| r.entree}
  end

  def show
    @list = List.find_by_title(params[:id])
  end

  def create
    list = List.create(list_params)
    params[:restaurant_ids].each_with_index do |id, indx| 
      list.restaurants << Restaurant.find(id)
      RestaurantListing.last.update(body: params[:description][:restaurant_bodies][indx]) # rank: indx
    end

    redirect_to admin_path(1)
  end

  def edit
    @list = List.find_by_title(params[:id])
  end

  def destroy
    List.find(params[:id]).destroy

    redirect_to admin_path(1)
  end

  private

  def list_params
    params.require(:list).permit(:title, :body)
  end
end
