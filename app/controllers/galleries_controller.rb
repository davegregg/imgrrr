class GalleriesController < ApplicationController
  before_action :require_user, only: [:new, :create, :create_share, :edit, :update, :destroy]

  def show
    # @gallery_mailer = GalleryMailer.new()
    @gallery = Gallery.includes(:images).find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create_share
    GalleryMailer.share(params[:gallery_mailer][:recipient_name], params[:gallery_mailer][:recipient_email], params[:gallery_mailer][:gallery_url], current_user).deliver
    respond_to do |format|
      format.html # send html back
      format.js # send javascript
    end
    # flash[:success] = 'Yay! You\'ve successfully given up some private information! Expect a creepy email from us confirming your admission into the mainframe.'
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit; end

  def update
    case params[:commit]
    when 'Update Gallery'
      gallery.update!(gallery_params)
    when 'Delete Gallery'
      destroy
    end
    redirect_to current_user
  end

  def destroy
    gallery.images.each do |image|
      member_galleries = Image.find(image.id).galleries
      if member_galleries.count > 1
        gallery.images.delete(image.id)
      else
        Imaging.find_by(image_id: image.id).delete
        Image.find(image.id).delete
      end
    end
    gallery.destroy!
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
