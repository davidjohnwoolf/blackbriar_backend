Rails.application.routes.draw do
  root 'pages#index'

  resources :users
  resources :admins, only: [:show, :edit, :update]
  resources :customers
  resources :training_videos
  resources :resources, except: :show

  get '/log_in' => 'user_sessions#new', as: :log_in
  post '/log_in' => 'user_sessions#create'
  delete '/log_out' => 'user_sessions#destroy', as: :log_out

  get '/log_in_admin' => 'admin_sessions#new', as: :log_in_admin
  post '/log_in_admin' => 'admin_sessions#create'
  delete '/log_out_admin' => 'admin_sessions#destroy', as: :log_out_admin

  get '/search_results' => 'search_results#index'

end
