FactoryGirl.define do
  factory :taxi_driver_location do
    latitude { rand(-90.0..90.0) }
    longitude { rand(-180.0..180.0) }
  end
end
