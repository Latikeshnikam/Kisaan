Rails.application.routes.draw do
  devise_for :farmers, :controllers => { registrations: 'farmers/registrations' }
  resources :farmer_instruments
  resources :instruments
  resources :farmers
  resources :rents
  root 'farmer_instruments#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
