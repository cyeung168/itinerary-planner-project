class Itinerary < ActiveRecord::Base
  validates :origin, :destination, :name, presence: true
  validates :origin, :destination, numericality: true
  has_many :destinations, through: :destinations_itineraries
  has_many :users, through: :itineraries_users
  has_many :comments, as: :commentable
end
