class Bbox
  attr_accessor :ne, :ne_latitude, :ne_longitude,
                :sw, :sw_latitude, :sw_longitude

  def initialize(ne, sw)
    @ne = lat_long(ne)
    @sw = lat_long(sw)

    @ne_latitude = @ne.first
    @ne_longitude = @ne.last

    @sw_latitude = @sw.first
    @sw_longitude = @sw.last
  end

  def to_s
    "POLYGON ((#{ bbox_points }))"
  end

  private

  def bbox_points
    [
      "#{ne_longitude} #{ne_latitude}",
      "#{sw_longitude} #{ne_latitude}",
      "#{sw_longitude} #{sw_latitude}",
      "#{ne_longitude} #{sw_latitude}",
      "#{ne_longitude} #{ne_latitude}"
    ].join(',')
  end

  def lat_long(value)
    value.to_s.split(',')
  end
end
