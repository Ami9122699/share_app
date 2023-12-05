Rails.application.routes.draw do
  get 'room/index'
  get 'home/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :room
end

