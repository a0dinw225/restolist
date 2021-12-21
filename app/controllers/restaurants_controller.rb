class RestaurantsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @pagy, @restaurants = pagy(Restaurant.all, items: 5)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @post = Post.new
    @posts = @restaurant.posts.order(created_at: :desc)
  end
end
