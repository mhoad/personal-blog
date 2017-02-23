class ImagesController < ApplicationController
  before_action :find_image, only: [:edit, :update, :show, :destroy]
  before_action :auth_admin!

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = 'Successfully uploaded image.'
      redirect_to image_path(@image)
    else
      flash[:alert] = 'Error uploading image.'
      render :new
    end
  end

  def edit
  end

  def update
    if @image.update_attributes(image_params)
      flash[:notice] = 'Successfully updated image.'
      redirect_to image_path(@image)
    else
      flash[:alert] = 'Error updating image.'
      render :edit
    end
  end

  def show
  end

  def destroy
    if @image.destroy
      flash[:notice] = 'Successfully deleted image.'
      redirect_to images_path
    else
      flash[:alert] = 'Error deleting image.'
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :caption, :licence, :geo_location, :image)
  end

  def find_image
    @image = Image.find(params[:id])
  end

  def auth_admin!
    redirect_to root_path, alert: "You aren't allowed to do that." unless admin_signed_in?
  end
end
