Rails.application.routes.draw do
  resources :parcel_records
  get 'download_csv', to: "parcel_records#download_csv"
  resources :service_types
  resources :parcels
  resources :addresses
  devise_for :users
  resources :users
  root to: 'parcels#index'
  get '/search', to: 'search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
