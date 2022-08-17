Rails.application.routes.draw do
  # get 'day/update'
  # get 'home/index'
  resources :days, only: [:update]
  devise_for :users
  root "home#index"
end
