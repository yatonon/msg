Rails.application.routes.draw do
  get 'messages/index'
  get 'users/index'
  devise_for :users
  root 'pages#home'

  get 'page/home'
  get 'room', to: 'messages#show', as: :room
  resources :channels
  resources :channelmessages
end
