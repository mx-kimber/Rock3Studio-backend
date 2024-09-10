class RocksController < ApplicationController
  before_action :set_rock, only: %i[ show update destroy ]


  def index
    @rocks = Rock.includes(:photos).all
    render json: @rocks.as_json(include: :photos)
  end

  def show
    render json: @rock.as_json(include: :photos)
  end

  def create
    @rock = Rock.new(rock_params)
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
    render json: { message: "Rock and photos deleted" }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Rock not found" }, status: :not_found
  end

  private

    def set_rock
      @rock = Rock.includes(:photos).find(params[:id])
    end

    def rock_params
      params.permit(:rock_name, :material, :weight, :weight_unit, :location, :notes, :color, :condition, :dimensions, :source, :category, :hardness, :price)
    end
end
