Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
  
  get '/verification', to: 'verification#show'
  
  get "/profile/:user_id", to: "users#show", as: 'user_profile'

  devise_for :users
  resources :posts
end
