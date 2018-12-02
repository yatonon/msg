Rails.application.routes.draw do
  devise_for :users
  # , controllers: { registrations: 'users/registrations' }
  root 'pages#home'
  get 'page/home'
  resources :users
  resources :channels do
    member do
      get 'invite_user_index'
      post 'invite_user'
    end
  end
  resources :messages, only: %i(create edit update destroy)
end
