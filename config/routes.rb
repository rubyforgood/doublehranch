Rails.application.routes.draw do
  root to: 'home#index'

  get '/verification', to: 'verification#show'

  devise_for :users
  resources :posts
end
