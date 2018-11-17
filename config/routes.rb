Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root 'pages#home'

  get 'page/home'
  # resources :user do
  #   resources :message
  # end
end
