class TaxiDriver < ActiveRecord::Base
  validates :name, :license_plate, presence: true
end
