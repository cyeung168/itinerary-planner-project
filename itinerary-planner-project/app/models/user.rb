class User < ActiveRecord::Base
  validates :user_name, :password, :first_name, :last_name, :email, presence: true
  validates :user_name, uniqueness: true
  has_secure_password

  has_many :itineraries, through: :itineraries_users
  has_many :destinations, through: :destinations_users
  has_many :comments

  def confirm(password_param)
    authenticate(password_param)
  end
end

