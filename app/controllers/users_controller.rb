class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/:id
  def show
    render json: @user
  end

  # GET /users/email/:email
  def get_by_email
    @user = User.find_by(email: params[:email])

    if @user
      render json: @user
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render_error(@user.errors)
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render_error(@user.errors)
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    render json: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:id, :name, :email, :image, :message)
    end

    def render_error(errors)
      render json: { errors: errors }, status: :unprocessable_entity
    end
end
