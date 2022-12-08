class MembersController < ApplicationController
  before_action :authentication_user!

  def show
    user = get_user_from_token
    render json: {
      message: "If you see this, you're in!",
      user: user
    }
  end

  private

  def get_user_from_token
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ')[1]

    jwt_payload = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    user = User.find(user_id.to_s)
  end
end