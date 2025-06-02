Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check


  # Auth with Devise

  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }


 # Dashboard

 get "dashboard", to: "dashboards#show"


 # RentPayments

 get "/rent_payments/contract/:rental_contract_id", to: "rent_payments#show_by_contract"
 post "rent_payments/filter", to: "rent_payments#filter"

 # Neighborhoods

 get "/neighborhoods/find_by_city/:city_id",  to: "neighborhoods#find_by_city"

#   Properties

get "/properties/rent_all", to: "properties#rent_all"

  # Resources

  resources :cities
  resources :neighborhoods
  resources :clients
  resources :owners
  resources :properties
  resources :property_types
  resources :rental_contracts
  resources :rent_payments
end
