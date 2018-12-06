Rails.application.routes.draw do
  resources :friends
  get 'friends_serch', to: 'friends#serch'
  devise_for :users
  # , controllers: { registrations: 'users/registrations' }
  root 'pages#home'
  get 'page/home'

  resources :users
  get 'profile', to: 'users#profile'
  resources :channels
  resources :channels do
    member do
      get 'invite_user_index'
      post 'invite_user'
    end
  end
  get '/img_posts', to: 'img_posts#show'
  post '/img_posts/create', to: 'img_posts#create'
  
  resources :messages, only: %i(create edit update destroy)
end
