Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :taxi_drivers, only: [:create, :show]
    resources :taxi_driver_locations, only: [:create, :index]
  end
end
