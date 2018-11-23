Rails.application.routes.draw do
  devise_for :users
  # get 'rooms/show'
  get 'messages/index'
  get 'users/index'
  root 'pages#home'

  get 'page/home'
  # resources :rooms
  resources :channels
  resources :channelmessages
end
