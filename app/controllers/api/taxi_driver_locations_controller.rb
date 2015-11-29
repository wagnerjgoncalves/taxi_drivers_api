class API::TaxiDriverLocationsController < ApplicationController
  def create
    resource = TaxiDriverLocation.new(resource_params)

    if resource.valid?
      resource.save!
      resource.update_taxi_driver_availability(available_taxi_driver_param)

      render nothing: true, head: :ok
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def index
    @resources = ::TaxiDriverLocationFilter.new.available_by_bbbox(filter_params)

    render json: @resources, root: false
  end

  private

  def resource_params
    params.require(:taxi_driver_location).permit(:taxi_driver_id, :latitude, :longitude)
  end

  def available_taxi_driver_param
    params.require(:taxi_driver_location).permit(:available).fetch(:available, nil)
  end

  def filter_params
    params.permit(:ne, :sw)
  end
end
