class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.like(restaurant)
    flash[:success] = 'いいねしました。'
    redirect_to restaurants_path
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    current_user.unlike(restaurant)
    flash[:success] = '取り消しました。'
    redirect_to restaurants_path
  end
end
