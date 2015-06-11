Rails.application.routes.draw do
  resources :posts do
   resources :comments, except: [:show, :index]
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup',
        via: [:get, :patch],
        :as => :finish_signup

  root 'posts#index'
  resources :posts
  get '/users', to: 'pages#users_all'
  get '/users/:id/edit', to: 'pages#user_profile_edit', as: 'edit_profile'
  patch '/users/:id', to: 'pages#user_profile_update', as: 'update_profile'
end
