class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show update destroy ]
  def index
    @photos = Photo.all
    render json: @photos
  end
  
  def show
    render json: @photo
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: @photo, status: :created
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  def update
    if @photo.update(photo_params)
      render json: @photo, status: :ok
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end 

  def destroy
    @photo.destroy!
    head :no_content
  end

  private

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.permit(:rock_id, :url)
    end
end
