class TaxiDriverLocation < ActiveRecord::Base
  belongs_to :taxi_driver

  validates :taxi_driver, :latitude, :longitude, presence: true

  delegate :available, to: :taxi_driver

  scope :available, -> { joins(:taxi_driver).merge(TaxiDriver.available) }
  scope :ordered, -> { order("created_at desc") }

  scope :by_bbox, -> (bbox) {
    where(%{
      ST_Intersects(
        GeomFromEWKT(
          'POINT(' || taxi_driver_locations.longitude || ' ' || taxi_driver_locations.latitude || ')'
        ),
        GeomFromEWKT('#{bbox.to_s}')
      )
    })
  }

  def update_taxi_driver_availability(available)
    if [true, false].include?(available) && taxi_driver.persisted?
      taxi_driver.update_attribute(:available, available)
    end
  end
end
