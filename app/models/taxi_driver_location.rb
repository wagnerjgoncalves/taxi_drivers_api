class TaxiDriverLocation < ActiveRecord::Base
  belongs_to :taxi_driver

  validates :taxi_driver, :latitude, :longitude, presence: true

  def update_taxi_driver_availability(available)
    if [true, false].include?(available) && taxi_driver.persisted?
      taxi_driver.update_attribute(:available, available)
    end
  end
end
