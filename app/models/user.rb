class User < ApplicationRecord
  has_secure_password

  has_many :subtracks, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  before_create :generate_auth_token

  def rotate_auth_token!
    update!(auth_token: SecureRandom.hex(32))
  end

  private
  def generate_auth_token
    self.auth_token ||= loop do
      token = SecureRandom.hex(32)
      break token unless User.exists?(auth_token: token)
    end
  end
end
