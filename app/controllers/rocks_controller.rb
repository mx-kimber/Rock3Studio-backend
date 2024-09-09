class RocksController < ApplicationController
  before_action :set_rock, only: %i[ show edit update destroy ]

  # GET /rocks or /rocks.json
  def index
    @rocks = Rock.all
  end

  # GET /rocks/1 or /rocks/1.json
  def show
  end

  # GET /rocks/new
  def new
    @rock = Rock.new
  end

  # GET /rocks/1/edit
  def edit
  end

  # POST /rocks or /rocks.json
  def create
    @rock = Rock.new(rock_params)

    respond_to do |format|
      if @rock.save
        format.html { redirect_to rock_url(@rock), notice: "Rock was successfully created." }
        format.json { render :show, status: :created, location: @rock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rocks/1 or /rocks/1.json
  def update
    respond_to do |format|
      if @rock.update(rock_params)
        format.html { redirect_to rock_url(@rock), notice: "Rock was successfully updated." }
        format.json { render :show, status: :ok, location: @rock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rocks/1 or /rocks/1.json
  def destroy
    @rock.destroy!

    respond_to do |format|
      format.html { redirect_to rocks_url, notice: "Rock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rock
      @rock = Rock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rock_params
      params.require(:rock).permit(:rock_name, :type, :weight, :weight_unit, :location, :date_acquired, :notes, :color, :condition, :dimensions, :source, :category, :hardness, :price,)
    end
end
