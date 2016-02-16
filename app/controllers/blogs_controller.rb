class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)

    redirect_to admin_path(1)
  end

  def destroy
    Blog.find(params[:id]).destroy

    redirect_to admin_path(1)
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description)
  end
end

