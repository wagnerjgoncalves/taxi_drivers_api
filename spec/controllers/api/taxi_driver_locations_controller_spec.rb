require 'rails_helper'

describe API::TaxiDriverLocationsController do
  let!(:token) { APIKey.create(token: APIKey.generate).token }
  let!(:authorization) do
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  before do
    request.env['HTTP_AUTHORIZATION'] = authorization
  end

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
        expect(json['taxi_driver_id']).to include "can't be blank"
      end

      it do "sould not update available attribute at taxi driver"
        taxi_driver.reload

        expect(taxi_driver.available).to be false
      end
    end
  end

  describe "GET #index" do
    let!(:taxi_driver_1) { create(:taxi_driver, available: true) }
    let!(:taxi_driver_2) { create(:taxi_driver) }
    let!(:location_1) { create(:taxi_driver_location, taxi_driver: taxi_driver_1) }
    let!(:location_2) { create(:taxi_driver_location, taxi_driver: taxi_driver_1) }
    let!(:location_3) { create(:taxi_driver_location, taxi_driver: taxi_driver_1) }
    let!(:location_1) { create(:taxi_driver_location, taxi_driver: taxi_driver_2) }

    context 'display only available taxi driver' do
      before do
        get :index
      end

      it { expect(response.status).to eq 200 }

      it 'renders json error object' do
        json = JSON.parse(response.body)
        location = json.first

        expect(json.size).to eq 1

        expect(location['latitude']).to_not be_nil
        expect(location['longitude']).to_not be_nil
        expect(location['taxi_driver_id']).to_not be_nil
        expect(location['available']).to be true
      end
    end
  end
end
