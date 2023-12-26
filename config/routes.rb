Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  resource :users
  resources :rooms
  resources :reservations
end

