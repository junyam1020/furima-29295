Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  post 'items', to: 'items#create'

  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create]
end
