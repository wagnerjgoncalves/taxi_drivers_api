require 'rails_helper'

describe API::TaxiDriverLocationsController do
  describe 'POST #create' do
    let!(:taxi_driver) { create(:taxi_driver) }

    context 'success' do
      let!(:params) do
        attributes_for(:taxi_driver_location, taxi_driver_id: taxi_driver.id)
      end

      before do
        post :create, taxi_driver_location: params.merge(available: true)
      end

      it { expect(response.status).to eq 200 }

      it { expect(response.body).to be_empty }

      it do "should update available attribute at taxi driver"
        taxi_driver.reload

        expect(taxi_driver.available).to be true
      end
    end

    context 'error' do
      before do
        params = {
          latitude: nil,
          longitude: nil,
          taxi_driver_id: nil
        }

        post :create, taxi_driver_location: params.merge(available: true)
      end

      it { expect(response.status).to eq 422 }

      it 'renders json error object' do
        json = JSON.parse(response.body)

        expect(json['latitude']).to include "can't be blank"
        expect(json['longitude']).to include "can't be blank"
        expect(json['taxi_driver']).to include "can't be blank"
      end

      it do "sould not update available attribute at taxi driver"
        taxi_driver.reload

        expect(taxi_driver.available).to be false
      end
    end
  end
end
