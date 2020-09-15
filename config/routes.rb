Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :users, only: [:edit, :update]
  resources :items do
    resources :deals, only:[:index, :create, :new]
  end
end
