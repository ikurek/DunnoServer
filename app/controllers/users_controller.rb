class UsersController < ApplicationController

  # POST /users
  def create
    user = User.create!(user_params)
    render json: user.id
  end

  # GET /users/:id
  def show
    user = User.find(params[:id])
    render json: {"id": user.id, "name": user.name, "email": user.email}
  end

  # PUT /users/:id
  def update
    user = User.find(params[:id])
    user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end

  private
    # User params for post
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
