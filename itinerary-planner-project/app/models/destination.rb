class Destination < ActiveRecord::Base
  has_many :users, through: :destinations_users
  has_many :desination_itineraries
  has_many :itineraries, through: :desination_itineraries
  belongs_to :itineraries
  validates :location, :name, :info, presence: true
end
