class UsersController < ApplicationController
  skip_before_action :require_login

  # Signup page
  def new
    @user = User.new
  end

  # Handle signup
  def create
    user = User.new(user_params)

    if user.save
      SignupMailer.with(user: user).signup_mail.deliver_now
      redirect_to login_path, notice: "We've sent an email to #{user.email}, go click the confirmation link! <3"
    else
      redirect_to signup_path, notice: "Your password has to be at least 8 characters long, and contain one or more special characters"
    end
  end

  # Confirm account
  def confirm
    user = User.find_by(login: params[:login])
    if user&.single_access_token == params[:confirmation_token]
      user.update(confirmed: true)
      redirect_to login_path, notice: "Your account has been activated, please log in"
    else
      redirect_to login_path, alert: "Link was broken, or account is already active"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :login, :name, :password, :password_confirmation)
  end
end
