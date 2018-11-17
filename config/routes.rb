Rails.application.routes.draw do
  get 'channels/new'
  get 'channels/show'
  get 'messages/index'
  get 'users/index'
  devise_for :users
  root 'pages#home'

  get 'page/home'
  get 'room', to: 'messages#show', as: :room
  resources :channels
end
