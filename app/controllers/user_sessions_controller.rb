class UserSessionsController < ApplicationController
  skip_before_action :require_login

  # Login form
  def new
    if current_user
      redirect_to root_path
      return
    end

    @user_session = UserSession.new
  end

  # Handle login
  def create
    @user_session = UserSession.new(user_session_params.to_h)
    if @user_session.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  # Handle logout
  def destroy
    current_user_session.destroy
    redirect_to login_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:login, :password)
  end
end
