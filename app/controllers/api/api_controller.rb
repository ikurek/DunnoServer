class Api::ApiController < ActionController::Base
  skip_forgery_protection

  before_action :require_login

  def require_login
    unless current_user
      head :unauthorized
      return
    end
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session&.user
  end

  def single_access_allowed?
   true
  end
end
