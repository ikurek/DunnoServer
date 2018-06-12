class Api::ApiAuthController < Api::ApiController

  skip_before_action :require_login

  def token
    login = params[:login]
    password = params[:password]

    if (user = User.find_by(login: login))&.valid_password?(password)
      render json: {
        token: user.single_access_token
      }
    else
      head :unprocessable_entity
    end
  end
end
