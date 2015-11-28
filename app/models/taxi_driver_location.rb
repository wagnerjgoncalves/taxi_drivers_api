class TaxiDriverLocation < ActiveRecord::Base
  belongs_to :taxi_driver

  validates :taxi_driver, :latitude, :longitude, presence: true
end
