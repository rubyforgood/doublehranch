Rails.application.routes.draw do
  root to: "home#index"

  get '/verification', to: 'verification#show'

  get '/profile/:user_id', to: 'users#show', as: 'user_profile'

  post '/posts/:post_id/comment', to: 'posts#comment', as: 'comment_post'

  devise_for :users
  resources :posts
  resources :comments, only: [:update, :destroy]

end
