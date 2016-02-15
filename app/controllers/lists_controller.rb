class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = Lists.new
  end
end
