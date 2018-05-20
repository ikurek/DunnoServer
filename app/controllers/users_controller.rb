class UsersController < ApplicationController
  # GET /register
  def new
    @user = User.new
  end

  # POST /register
  # POST /register.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Parameters required for handling user UserSession
  # Throws error if any is missing or invalid
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
