class AdminsController < ApplicationController

  def show
    @restaurants = Restaurant.all
  end
end
