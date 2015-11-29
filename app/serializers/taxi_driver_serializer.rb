class TaxiDriverSerializer < ActiveModel::Serializer
  attributes :id, :available, :latitude, :longitude

  def latitude
    object.latitude.to_f if object.latitude.present?
  end

  def longitude
    object.longitude.to_f if object.latitude.present?
  end
end
