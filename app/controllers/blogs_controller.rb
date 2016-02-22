class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_title(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)

    redirect_to admin_path(1)
  end

  def edit
    @blog = Blog.find_by_title(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)

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

