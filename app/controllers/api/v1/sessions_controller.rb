class Api::V1::SessionsController < Api::V1::BaseController
  def destroy
    current_user.rotate_auth_token!
    head :no_content
  end
end
