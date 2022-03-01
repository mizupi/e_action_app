Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#index'

  resources :activities, only: :index

  resources :users, only: :show
end
