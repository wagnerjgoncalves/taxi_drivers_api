require 'rails_helper'

describe TaxiDriver do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :license_plate }
  end
end
