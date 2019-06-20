Rails.application.routes.draw do
  resources :friends
  get 'friends_serch', to: 'friends#serch'
  devise_for :users
  root 'pages#home'
  get 'page/home'

  resources :users
  get 'profile', to: 'users#profile'
  resources :rooms
  resources :channels
  resources :channels do
    member do
      get 'invite_user_index'
      post 'invite_user'
    end
  end

  resources :messages, only: %i(create edit update destroy)
end
