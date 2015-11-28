Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :taxi_drivers, only: :create
    resources :taxi_driver_locations, only: :create
  end
end
