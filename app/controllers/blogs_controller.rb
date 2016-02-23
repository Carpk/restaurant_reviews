class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find_by_title(params[:id])
    
    @blog.category_id ? restaurant_list = @blog.category.restaurants : restaurant_list = @blog.restaurant

    @hash = Gmaps4rails.build_markers(restaurant_list) do |rstrnt, marker|
      marker.lat rstrnt.latitude
      marker.lng rstrnt.longitude
      marker.title rstrnt.name
      marker.infowindow render_to_string(:partial => "/layouts/infowindow", :locals => { :object => rstrnt})
      marker.json({ :id => rstrnt.id })
    end
  end

  def new
    @blog = Blog.new
    @restaurants = Restaurant.all
    @categories = Category.all
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

