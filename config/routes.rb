Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :admins
  resources :customers

  get '/log-in' => 'user_sessions#new', as: :log_in
  post '/log-in' => 'user_sessions#create'
  delete '/log-out' => 'user_sessions#destroy', as: :log_out

  get '/log-in-admin' => 'admin_sessions#new', as: :log_in_admin
  post '/log-in-admin' => 'admin_sessions#create'
  delete '/log-out-admin' => 'admin_sessions#destroy', as: :log_out_admin
end
