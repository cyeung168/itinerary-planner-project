class CreateDestinationUsers < ActiveRecord::Migration
  def change
    create_table :destination_users do |t|
      t.references :destination, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :destination_users, :destinations
    add_foreign_key :destination_users, :users
  end
end
