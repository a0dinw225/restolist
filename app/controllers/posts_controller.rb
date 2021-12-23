class PostsController < ApplicationController
  before_action :correct_user, only: [:destroy]
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    post = Post.new(post_params)
    if post.save
      flash[:success] = 'コメントしました。'
      redirect_to restaurant_path(@restaurant)
    else
      flash[:danger] = 'コメントに失敗しました。'
      session[:error] = post.errors.full_messages
      redirect_back(fallback_location: restaurant_path(@restaurant))
    end
  end
  
  def destroy
    @post.destroy
    flash[:success] = 'コメントを削除しました。'
    redirect_back(fallback_location: restaurants_path)
  end

  private
  
  def post_params
    params.require(:post).permit(:content).merge(user_id: current_user.id, restaurant_id: params[:restaurant_id])
  end
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to restaurants_path
    end
  end
end