Rails.application.routes.draw do
 
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }


  resources :cities
  resources :neighborhoods
  resources :clients
  resources :owners
  resources :properties
  resources :property_types
  resources :rental_contracts
  resources :rent_payments
end

