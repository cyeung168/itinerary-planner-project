class Itinerary < ActiveRecord::Base
  validates :origin, :destination, :name, presence: true
<<<<<<< HEAD
  validates :origin, :destination, numericality: true
  has_many :destination_itineraries
  has_many :destinations, through: :destination_itineraries
  has_many :itineraries_users
=======

  has_many :destinations, through: :destinations_itineraries
>>>>>>> 8e8e94b84c5b1eb4b620589eae0d98f4c0263e44
  has_many :users, through: :itineraries_users
  has_many :comments, as: :commentable
end

