Rails.application.routes.draw do
  # get 'items/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  # post to: "#create"

  resources :users, only: [:edit, :update]
  resources :items, only: [:index]
end
