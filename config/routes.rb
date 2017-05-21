Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"
  resources :email_templates

  get "/profile/:id", to: "users#show", as: 'user_profile'
  get "/profile/:user_id/edit", to: "users#edit", as: 'edit_user_profile'
  post "/profile/:user_id/update", to: "users#update", as: 'update_user_profile'
  get "/profiles", to: "users#index", as: 'user_profiles'
  get "/grapevine", to: "users#index", as: 'grapevine'

  get   "/users/:token/verify", to: "verification#edit", as: "verification"
  patch "/users/:token/verify", to: "verification#update", as: "update_verification"

  post '/posts/:post_id/comment', to: 'posts#comment', as: 'comment_post'

  get 'tags/:tag', to: 'posts#index', as: :tag

  devise_for :users
  resources :posts do
    get :autocomplete_tag_name, :on => :collection
  end
  resources :comments, only: [:update, :destroy]

end
