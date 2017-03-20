class SessionController < ApplicationController

  def stage
    redirect_to current_user if current_user
  end

  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You're logged in, #{@user.username}"
      redirect_to @user
    else
      flash[:danger] = 'Invalid username or password. Try again.'
      redirect_to :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
