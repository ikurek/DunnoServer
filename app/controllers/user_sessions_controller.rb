class UserSessionsController < ApplicationController
  # GET /login
  def new
    @user_session = UserSession.new
  end

  # POST /login
  # POST /login.json
  # QUESTION: Where the fuck did I actually route this?
  def create
    @user_session = UserSession.new(user_session_params.to_h)

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to questions_url }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to new_user_session_url
  end

  private

  # Parameters required for handling user UserSession
  # Throws error if any is missing or invalid
  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
