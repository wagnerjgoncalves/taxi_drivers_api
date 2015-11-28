def random_license_plate
  plate_letters = ('a'..'z').to_a.shuffle.join.upcase[0, 3]
  plate_numbers = rand(1000..9000)

  "#{ plate_letters }-#{ plate_numbers.to_s }"
end

FactoryGirl.define do
  factory :taxi_driver do
    sequence(:name) { |n| "Taxi Driver #{n}" }
    license_plate { random_license_plate }
  end
end
