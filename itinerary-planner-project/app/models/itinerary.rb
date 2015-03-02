class Itinerary < ActiveRecord::Base
  validates :origin, :destination, :name, presence: true
  validates :origin, :destination, numericality: true
  has_many :destination_itineraries
  has_many :destinations, through: :destination_itineraries
  has_many :itineraries_users
  has_many :users, through: :itineraries_users
  has_many :comments, as: :commentable
end

