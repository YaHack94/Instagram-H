Rails.application.routes.draw do
  get 'sessions/new'
  root to: "users#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
