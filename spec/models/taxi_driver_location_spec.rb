require 'rails_helper'

describe TaxiDriverLocation do
  describe 'associations' do
    it { should belong_to :taxi_driver }
  end

  describe 'validations' do
    it { should validate_presence_of :taxi_driver }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
  end
end
