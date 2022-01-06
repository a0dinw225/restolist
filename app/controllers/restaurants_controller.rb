class RestaurantsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @pagy, @restaurants = pagy(Restaurant.all, items: 5)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @post = Post.new
    @pagy,@posts = pagy(@restaurant.posts.includes(:user).order(created_at: :desc), items: 5)
  end
end
