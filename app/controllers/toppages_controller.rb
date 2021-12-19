class ToppagesController < ApplicationController
  before_action :user_logged_in
  def index
  end
  
  private
  
  def user_logged_in
    if logged_in?
      redirect_to restaurants_path
    end
  end
end
