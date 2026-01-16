class Api::V1::AuthController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [ :create ]

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      user.rotate_auth_token!
      render json: { token: user.auth_token }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
