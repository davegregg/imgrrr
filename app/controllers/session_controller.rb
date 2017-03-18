class SessionController < ApplicationController

  def new; end

  def create
    @user = User.find_by(params[:session][:username])

    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = 'You\'re logged in, dog.'
      redirect_to :root
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
