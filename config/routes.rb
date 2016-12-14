Rails.application.routes.draw do
  get '/profile', to: 'profile#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'sessions#index'

  resources :comments
  resources :users, only: [:update]
  resources :boards

  get '/dashboard', to: 'users#show'
  get '/users/new', to: 'users#new', as: 'new_user'
  get '/users/edit', to: 'users#edit'
  post 'users', to: 'users#create'

end
