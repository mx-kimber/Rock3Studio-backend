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

    if photo_params[:rock_id].present?
      rock = Rock.find_or_initialize_by(id: photo_params[:rock_id])
    else
      rock = Rock.create!(rock_params_for_rock)
    end

    @photo = rock.photos.build(photo_params.except(:rock_id))

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

    def rock_params_for_rock
      params.permit(:rock_name, :material, :weight, :weight_unit, :location, :notes, :color, :condition, :dimensions, :source, :category, :hardness, :price)
    end
end
