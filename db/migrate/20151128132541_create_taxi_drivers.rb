class CreateTaxiDrivers < ActiveRecord::Migration
  def change
    create_table :taxi_drivers do |t|
      t.string :name, index: true, null: false
      t.string :license_plate, null: false
      t.boolean :available, default: false

      t.timestamps null: false
    end
  end
end
