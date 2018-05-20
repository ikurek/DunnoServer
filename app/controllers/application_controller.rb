class ApplicationController < ActionController::Base

# Marking helper methods to maintain user session
helper_method :current_user_session, :current_user

# Redirects to login screen
# If current_user doesn't exist (no user is logged in)
def require_login
    redirect_to login_path unless current_user
end

private
  # Finds and returns session of current user
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    # Finds and returns user bound with current session
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
