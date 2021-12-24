class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
  before_action :logged_in_index_action, only: [:index]
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
    @pagy, @likes = pagy(@user.like_restaurants.order(id: :desc), items: 3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  # /users にアクセスされた際のリダイレクト先
  # 会員登録で登録失敗してブラウザのリロードを押した際のエラーページ防止
  def logged_in_index_action
    if logged_in?
      redirect_to user_path(@current_user)
    else
      redirect_to signup_url
    end
  end
end
