class TaxiDriver < ActiveRecord::Base
  has_many :taxi_driver_locations

  validates :name, :license_plate, presence: true
end
