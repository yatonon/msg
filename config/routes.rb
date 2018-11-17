Rails.application.routes.draw do
  get 'rooms/show'
  get 'messages/index'
  get 'users/index'
  devise_for :users
  root 'pages#home'

  get 'page/home'
  # get 'room', to: 'messages#show', as: :room
  resources :rooms
  # resources :messages
end
