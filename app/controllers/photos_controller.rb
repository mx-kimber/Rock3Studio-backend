class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show update destroy]

  def index
    @photos = current_user.photos.includes(:rock)
    render json: @photos
  end
  
  def show
    render json: @photo
  end

  def create
    if photo_params[:rock_id].present?
      rock = current_user.rocks.find_by(id: photo_params[:rock_id])
      unless rock
        render json: { error: "Rock not found or doesn't belong to the user" }, status: :not_found and return
      end
    else
      rock = current_user.rocks.create!(rock_params_for_rock)
    end

    @photo = rock.photos.build(photo_params.except(:rock_id))
    @photo.user = current_user

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
    render json: { message: "Photo has been deleted" }, status: :ok
  end
  

  private

    def set_photo
      @photo = current_user.photos.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Photo not found or doesn't belong to the user" }, status: :not_found
    end

    def photo_params
      params.permit(:rock_id, :url)
    end

    def rock_params_for_rock
      params.permit(:rock_name, :material, :weight, :weight_unit, :location, :notes, :color, :condition, :dimensions, :source, :category, :hardness, :price)
    end
end
