Rails.application.routes.draw do
  root to: "home#index"
  resources :email_templates

  get '/verification', to: 'verification#show'

  get "/profile/:user_id", to: "users#show", as: 'user_profile'
  get "/profile/:user_id/edit", to: "users#edit", as: 'edit_user_profile'
  get "/profile/:user_id/update", to: "users#update", as: 'update_user_profile'
  get "/profiles", to: "users#index", as: 'user_profiles'

  get '/verification', to: 'verification#show'

  post '/posts/:post_id/comment', to: 'posts#comment', as: 'comment_post'

  devise_for :users
  resources :posts
  resources :comments, only: [:update, :destroy]

end
