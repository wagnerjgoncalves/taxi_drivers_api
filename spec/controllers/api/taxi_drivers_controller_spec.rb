require 'rails_helper'

describe API::TaxiDriversController do
  describe 'POST #create' do
    context 'success' do
      let!(:params) { FactoryGirl.attributes_for(:taxi_driver) }

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
end
