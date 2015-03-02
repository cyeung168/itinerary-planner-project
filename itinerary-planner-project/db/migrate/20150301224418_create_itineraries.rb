class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :origin
      t.string :destination
      t.string :name
      t.date :depart_date
      t.date :return_date

      t.timestamps null: false
    end
  end
end
