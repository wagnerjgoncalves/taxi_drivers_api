class TaxiDriver < ActiveRecord::Base
  has_many :taxi_driver_locations

  validates :name, :license_plate, presence: true

  delegate :latitude, :longitude, to: :last_location, allow_nil: true

  def last_location
    taxi_driver_locations.order("created_at DESC").first
  end
end
