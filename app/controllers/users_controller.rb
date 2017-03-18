class UsersController < ApplicationController

  def index; end
  def show; end
  def update; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :email,
                                 :avatar,
                                 :password)
  end

  def require_self
    if user != current_user
      flash[:danger] = "Nope."
      redirect_to :root
    end
  end

  helper_method def users
    @users ||= User.all
  end

  helper_method def user
    @user ||= users.find(params[:id])
  end

end
