Rails.application.routes.draw do
  
  resources :days, only: [:update]
  
  devise_for :users
  root "home#index"
end
