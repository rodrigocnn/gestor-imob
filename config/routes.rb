Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :cities
  resources :neighborhoods
  resources :clients
  resources :owners
  resources :properties
  resources :property_types
  resources :rental_contracts
  resources :rent_payments
end

