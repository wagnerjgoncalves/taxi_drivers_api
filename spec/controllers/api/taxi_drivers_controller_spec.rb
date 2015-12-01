require 'rails_helper'

describe API::TaxiDriversController do
  let!(:token) { APIKey.create(token: APIKey.generate).token }
  let!(:authorization) do
    ActionController::HttpAuthentication::Token.encode_credentials(token)
  end

  before do
    request.env['HTTP_AUTHORIZATION'] = authorization
  end

  describe 'POST #create' do
    context 'success' do
      let!(:params) { attributes_for(:taxi_driver) }

      before do
        post :create, taxi_driver: params
      end

      it { expect(response.status).to eq 200 }

      it { expect(response.body).to be_empty }
    end

    context 'error' do
      before do
        params = {
          name: '',
          license_plate: ''
        }

        post :create, taxi_driver: params
      end

      it { expect(response.status).to eq 422 }

      it 'renders json error object' do
        json = JSON.parse(response.body)

        expect(json['name']).to include "can't be blank"
        expect(json['license_plate']).to include "can't be blank"
      end
    end
  end

  describe "GET #show" do
    let!(:taxi_driver) { create(:taxi_driver, available: true) }

    context "without location" do
      before do
        get :show, id: taxi_driver.id
      end

      it { expect(response.status).to eq 200 }

      it 'renders json object' do
        json = JSON.parse(response.body)

        expect(json['id']).to eq taxi_driver.id
        expect(json['available']).to be true

        expect(json['latitude']).to be_nil
        expect(json['longitude']).to be_nil
      end
    end

    context "with location" do
      let!(:location1) { create(:taxi_driver_location, taxi_driver_id: taxi_driver.id) }
      let!(:location2) { create(:taxi_driver_location, taxi_driver_id: taxi_driver.id) }

      before do
        get :show, id: taxi_driver.id
      end

      it { expect(response.status).to eq 200 }

      it 'renders json object' do
        json = JSON.parse(response.body)

        expect(json['id']).to eq taxi_driver.id
        expect(json['available']).to be true

        expect(json['latitude']).to eq location2.latitude.to_f
        expect(json['longitude']).to eq location2.longitude.to_f
      end
    end
  end
end
