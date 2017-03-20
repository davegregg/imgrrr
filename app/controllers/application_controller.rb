class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action ->{
    @title = 'imgrrr'
  }

  private

  helper_method def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if !current_user
      flash[:warning] = "Go on, login or sign up. You know you want to!"
      redirect_to login_path
    end
  end

end
