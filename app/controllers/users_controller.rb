class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def index
    if current_user
      render json: current_user.as_json(include: { rocks: { include: :photos } })
    else
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end
  
def show
  if current_user
    @user = current_user
    render :show
  else
    render json: { error: "Unauthorized access" }, status: :unauthorized
  end
end

def create
  @user = User.new(user_params)
  if @user.save
    render json: @user.as_json(include: { rocks: { include: :photos } }), status: :created
  else
    render json: { errors: @user.errors.full_messages }, status: :bad_request
  end
end

  def update
    if current_user.update(user_params)
      render json: current_user.as_json(include: { rocks: { include: :photos } }), status: :ok
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user = current_user
      @user.destroy
      render json: { message: "User destroyed successfully" }
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private

  def user_params
    params.permit(:full_name, :user_name, :email, :password, :password_confirmation)
  end
end
