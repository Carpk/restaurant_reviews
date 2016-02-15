class AdminsController < ApplicationController

  def show
    @restaurants = Restaurant.all
    @blogs = Blog.all
    @lists = List.all
  end
end
