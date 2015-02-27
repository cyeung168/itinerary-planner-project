class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :origin
      t.string :destination
      t.string :name
      t.integer :depart_date
      t.integer :return_date

      t.timestamps null: false
    end
  end
end
