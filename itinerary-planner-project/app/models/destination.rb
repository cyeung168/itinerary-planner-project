class Destination < ActiveRecord::Base
  has_many :users, through: :destinations_users
  belongs_to :itineraries
  validates :location, :name, :info, presence: true
end
