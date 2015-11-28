class CreateTaxiDriverLocations < ActiveRecord::Migration
  def change
    create_table :taxi_driver_locations do |t|
      t.references :taxi_driver, index: true, foreign_key: true, null: false
      t.decimal :latitude, precision: 9, scale: 6, null: false
      t.decimal :longitude, precision: 9, scale: 6, null: false

      t.timestamps null: false
    end
  end
end
