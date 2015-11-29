class TaxiDriver < ActiveRecord::Base
  has_many :taxi_driver_locations

  validates :name, :license_plate, presence: true

  delegate :latitude, :longitude, to: :last_location, allow_nil: true

  scope :available, -> { where(available: true) }

  def last_location
    taxi_driver_locations.ordered.first
  end
end
