module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    helper_method :current_user if respond_to?(:helper_method)
  end

  private

  def authenticate_user!
    return if current_user

    render json: { error: "Unauthorized" }, status: :unauthorized
    throw :abort
  end

  def current_user
    @current_user ||= begin
      token = request.headers["Authorization"]&.split&.last
      User.find_by(auth_token: token)
    end
  end
end
