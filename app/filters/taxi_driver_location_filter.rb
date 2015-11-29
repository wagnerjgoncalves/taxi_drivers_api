class TaxiDriverLocationFilter
  attr_accessor :repository

  def initialize(repository = TaxiDriverLocation)
    self.repository = repository
  end

  def available_by_bbbox(options = {})
    ne = options.fetch(:ne, nil)
    sw = options.fetch(:sw, nil)

    availables = repository.available.ordered
    availables = availables.by_bbox(Bbox.new(ne, sw)) if ne.present? && sw.present?
    availables.group_by(&:taxi_driver_id).collect { |k,v| v.first }
  end
end
