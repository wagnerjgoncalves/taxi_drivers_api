class TaxiDriverLocationSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :taxi_driver_id, :available

  def latitude
    object.latitude.to_f if object.latitude.present?
  end

  def longitude
    object.longitude.to_f if object.latitude.present?
  end
end
