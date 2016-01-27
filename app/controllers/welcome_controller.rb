class WelcomeController < ApplicationController

  def index
    @categories = Category.all
    @latest = Review.last
  end
end
