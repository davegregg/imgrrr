class GalleriesController < ApplicationController
  before_action :require_user, only: [:new, :create, :destroy]

  def index
    redirect_to User.all.sample
  end

  def show
    @gallery = Gallery.includes(:images).find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      redirect_to @gallery
    else
      render :new
    end
  end

  private
  
  helper_method def galleries
    @galleries ||= User.find(session[:user_id]).galleries.all
  end

  helper_method def gallery
    # @gallery ||= galleries.find_by(user_id: params[:id])
    @gallery ||= User.find(session[:user_id]).galleries.includes(:images).find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:title, :description, :image)
  end

end
