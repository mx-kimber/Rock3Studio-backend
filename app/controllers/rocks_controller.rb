class RocksController < ApplicationController
  before_action :set_rock, only: %i[show update destroy]
  before_action :authenticate_user

  def index
    @rocks = current_user.rocks.includes(:photos)
    
    if @rocks.empty?
      render json: { message: "User has no rocks" }, status: :ok
    else
      render json: @rocks.as_json(include: :photos), status: :ok
    end
  end

  def show
    render json: @rock.as_json(include: :photos)
  end

  def create
    @rock = current_user.rocks.build(rock_params)
    
    if @rock.save
      render json: @rock.as_json(include: :photos), status: :created
    else
      render json: @rock.errors, status: :unprocessable_entity
    end
  end

  def update
    if @rock.update(rock_params)
      render json: @rock.as_json(include: :photos), status: :ok
    else
      render json: @rock.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @rock.destroy
    render json: { message: "Rock and associated photos deleted" }, status: :ok
  end

  private

  def set_rock
    @rock = current_user.rocks.includes(:photos).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Rock not found or doesn't belong to the user" }, status: :not_found
  end

  def rock_params
    params.permit(:rock_name, :material, :weight, :weight_unit, :location, :notes, :color, :condition, :dimensions, :source, :category, :hardness, :price)
  end
end
