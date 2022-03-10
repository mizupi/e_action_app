Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'

  resources :activities, only: [:new, :create]
  resources :users, only: [:show,:index]
  resources :user_activities, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]

end
