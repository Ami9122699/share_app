Rails.application.routes.draw do
  get 'home/top'
  post 'reservations/confirm'
  devise_for :users
  resource :users
  resources :rooms
  resources :reservations
end

