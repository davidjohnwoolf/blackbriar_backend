Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :admins

  get '/login' => 'user_sessions#new', as: :log_in
  post '/login' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy', as: :log_out
end
