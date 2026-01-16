class Api::V1::UsersController < Api::V1::BaseController
  def me
    render json: {
      id: current_user.id,
      email: current_user.email
    }
  end
end
