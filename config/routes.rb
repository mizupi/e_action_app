Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#index'

  resources :activities, only: [:new, :create]
  resources :users, only: :show do
    member do
      get :followings, :followers
    end
  end
  resources :user_activities, only: [:new, :create]
  resources :relationships, only: [:create, :destroy]

end
