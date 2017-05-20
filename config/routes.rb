Rails.application.routes.draw do
  root to: "home#index"
  
  get '/verification', to: 'verification#show'
  
  get "/profile/:user_id", to: "users#show", as: 'user_profile'
  get "/profile/:user_id/edit", to: "users#edit", as: 'edit_user_profile'
  get "/profiles", to: "users#index", as: 'user_profiles'

  devise_for :users
  resources :posts
end
