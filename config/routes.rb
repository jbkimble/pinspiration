Rails.application.routes.draw do
  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'sessions#index'

  get '/users/new', to: 'users#new', as: 'new_user'
  post 'users', to: 'users#create'
end
