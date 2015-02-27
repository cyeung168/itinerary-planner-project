class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :location
      t.string :name
      t.integer :date

      t.timestamps null: false
    end
  end
end
