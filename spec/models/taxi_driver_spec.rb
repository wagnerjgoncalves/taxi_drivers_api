require 'rails_helper'

describe TaxiDriver do
  describe 'associations' do
    it { should have_many :taxi_driver_locations }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :license_plate }
  end
end
