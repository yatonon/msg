Rails.application.routes.draw do
  devise_for :users
  # , controllers: { registrations: 'users/registrations' }
  root 'pages#home'
  get 'page/home'
  resources :users
  resources :channels
  resources :messages, only: %i(create edit update destroy)
end
