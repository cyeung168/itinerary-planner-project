class DestinationItinerary < ActiveRecord::Base
  belongs_to :destination
  belongs_to :itinerary
end
