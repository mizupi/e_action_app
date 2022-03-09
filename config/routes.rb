Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#index'

  resources :activities, only: [:new, :create]
  resources :users, only: :show do
    resources :relationships, only:[:create, :destroy]
  end
  resources :user_activities, only: [:new, :create]

end
