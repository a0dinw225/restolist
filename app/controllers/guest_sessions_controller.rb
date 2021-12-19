class GuestSessionsController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.name = "ゲストユーザー"
    @user.email = SecureRandom.alphanumeric(15) + "@email.com"
    @user.password = SecureRandom.alphanumeric(10)
    @user.save
    session[:user_id] = @user.id
    redirect_to @user
  end
  
  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
