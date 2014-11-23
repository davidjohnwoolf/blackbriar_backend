Rails.application.routes.draw do
  root 'home#index'

  resources :users

  get '/login' => 'user_sessions#new', as: :log_in
  post '/login' => 'user_sessions#create'
  get '/logout' => 'user_sessions#destroy', as: :log_out
end
