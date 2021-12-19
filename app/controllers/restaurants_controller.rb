class RestaurantsController < ApplicationController
  def index
    @pagy, @restaurants = pagy(Restaurant.all, items: 5)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
