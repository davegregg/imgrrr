class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def show
    if params[:gallery_id]
      gallery_id = params[:gallery_id].to_i
      image_id = params[:id].to_i
      if Gallery.pluck(:id).include? gallery_id
        gallery = Gallery.find(gallery_id)
        if gallery.images.pluck(:id).include? image_id
          @image = images.find(image_id)
          render template: 'images/context'
        end
      else
        redirect_to '/'         #TODO: refactor: render error
      end
    end
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.new(image_params)
    if @image.save
      galleries = params[:image][:gallery_ids].reject { |g| g.to_s.empty? }
      galleries.each do |g|
        target_gallery = Gallery.find(g)
        if target_gallery.user == current_user
          target_gallery.images << @image
          target_gallery.save
        else
          redirect_to '/logout'
        end
      end
      redirect_to @image
    else
      render :new
    end
  end

  private

  helper_method def images
    @images ||= Image.all
  end

  helper_method def image
    @image ||= images.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:title, :caption, :file, :gallery_ids)
  end

end
