class RocksController < ApplicationController
  before_action :set_rock, only: %i[show update destroy]

  # GET /rocks
  def index
    if current_user.nil?
      render json: { message: "No rocks here!" }, status: :not_found
    else
      @rocks = current_user.rocks.includes(:photos)
  
      if @rocks.empty?
        render json: { message: "User has no rocks" }, status: :ok
      else
        render json: @rocks.as_json(include: :photos), status: :ok
      end
    end
  end
  
  # GET /rocks/:id
  def show
    render json: @rock.as_json(include: :photos)
  end

  # POST /rocks
  def create
    @rock = current_user.rocks.build(rock_params)
    if @rock.save
      render json: @rock.as_json(include: :photos), status: :created
    else
      render json: @rock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rocks/:id
  def update
    if @rock.update(rock_params)
      render json: @rock.as_json(include: :photos), status: :ok
    else
      render json: @rock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rocks/:id
  def destroy
    @rock.destroy
    render json: { message: "Rock and photos deleted" }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Rock not found" }, status: :not_found
  end

  private

    def set_rock
      @rock = current_user.rocks.includes(:photos).find(params[:id])
    end

    def rock_params
      params.permit(:rock_name, :material, :weight, :weight_unit, :location, :notes, :color, :condition, :dimensions, :source, :category, :hardness, :price)
    end
end
