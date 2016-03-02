class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
    @restaurants = Restaurant.all
  end

  def create
    list = List.create(list_params)
    list

    redirect_to admin_path(1)
  end

  def edit
    @list = List.find_by_title(params[:id])
  end

  def destory
    List.find(params[:id]).destroy    
  end

  private

  def list_params
    params.require(:list).permit(:title, :body)
  end
end
