Rails.application.routes.draw do
  get 'sessions/new'
  root to: "tasks#index"

  namespace  :admin do
    resources :users
  end
  
  resources :tasks
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end