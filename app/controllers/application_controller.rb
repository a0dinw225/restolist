class ApplicationController < ActionController::Base
  helper_method :counts
  
  include Pagy::Backend
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(restaurant)
    restaurant.users.count
  end
end
