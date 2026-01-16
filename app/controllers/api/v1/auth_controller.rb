class Api::V1::AuthController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: { token: user.auth_token }
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end
end
