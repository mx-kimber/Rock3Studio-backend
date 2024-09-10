class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  before_action :set_current_user, only: [:show, :update, :destroy]

  def index
    if current_user
      @users = User.includes(rocks: :photos).all
      render json: @users.as_json(include: { rocks: { include: :photos } }), status: :ok
    else
      render json: { error: "Unauthorized access" }, status: :unauthorized
    end
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: { message: "User destroyed successfully" }
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  private


  def set_current_user
    @user = current_user
  end

  def user_params
    params.permit(:full_name, :user_name, :email, :password, :password_confirmation)
  end
end
