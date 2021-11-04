Rails.application.routes.draw do
  resources :publications
  get 'sessions/new'
  root to: "users#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get  '*path', controller: 'application', action: 'render_404'
  post '*path', controller: 'application', action: 'render_404'
  get  '*path', controller: 'application', action: 'render_500'
  post '*path', controller: 'application', action: 'render_500'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
