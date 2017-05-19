Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  
  get "/profile/:user_id", to: "users#show", as: 'user_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :posts

end
