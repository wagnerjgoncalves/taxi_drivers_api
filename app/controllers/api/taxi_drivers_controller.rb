class API::TaxiDriversController < ApplicationController
  def create
    resource = TaxiDriver.new(resource_params)

    if resource.valid?
      resource.save!

      render nothing: true, head: :ok
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.require(:taxi_driver).permit(:name, :license_plate, :available)
  end
end
