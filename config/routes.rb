Rails.application.routes.draw do
  root to: "home#index"
  resources :email_templates

  get '/verification', to: 'verification#show'

  get "/profile/:user_id", to: "users#show", as: 'user_profile'

  devise_for :users
  resources :posts
end
