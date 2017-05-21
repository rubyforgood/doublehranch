Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"
  resources :email_templates

  get "/profile/:user_id", to: "users#show", as: 'user_profile'
  get "/profile/:user_id/edit", to: "users#edit", as: 'edit_user_profile'
  patch "/profile/:user_id/update", to: "users#update", as: 'update_user_profile'
  get "/profiles", to: "users#index", as: 'user_profiles'

  get   "/users/:user_id/verify", to: "verification#edit"
  patch "/users/:user_id/verify", to: "verification#update", as: "verification"

  get "/grapevine/", to: "users#index", as: 'grapevine'

  post '/posts/:post_id/comment', to: 'posts#comment', as: 'comment_post'

  get 'tags/:tag', to: 'posts#index', as: :tag

  devise_for :users
  resources :posts do
    get :autocomplete_tag_name, :on => :collection
  end
  resources :comments, only: [:update, :destroy]

end
