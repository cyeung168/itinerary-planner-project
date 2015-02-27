class CreateItineraryUsers < ActiveRecord::Migration
  def change
    create_table :itinerary_users do |t|
      t.references :user, index: true
      t.references :itinerary, index: true

      t.timestamps null: false
    end
    add_foreign_key :itinerary_users, :users
    add_foreign_key :itinerary_users, :itineraries
  end
end
