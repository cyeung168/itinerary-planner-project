class CreateDestinationItineraries < ActiveRecord::Migration
  def change
    create_table :destination_itineraries do |t|
      t.references :destination, index: true
      t.references :itinerary, index: true

      t.timestamps null: false
    end
    add_foreign_key :destination_itineraries, :destinations
    add_foreign_key :destination_itineraries, :itineraries
  end
end
