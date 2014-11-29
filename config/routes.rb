Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :admins

  get '/login' => 'user_sessions#new', as: :log_in
  post '/login' => 'user_sessions#create'
  delete '/logout' => 'user_sessions#destroy', as: :log_out

  get '/loginadmin' => 'admin_sessions#new', as: :log_in_admin
  post '/loginadmin' => 'admin_sessions#create'
  delete '/logoutadmin' => 'admin_sessions#destroy', as: :log_out_admin
end
