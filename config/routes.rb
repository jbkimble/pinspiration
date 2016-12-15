Rails.application.routes.draw do
  get '/profile', to: 'profile#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # root 'sessions#index'
  root 'pins#index'

  resources :comments

  resources :pins, path: 'pin'
  resources :users, only:[:new, :create, :edit, :update]
  resources :users, as: :user, path: ":user", only:[:index, :show]

  namespace :users, as: :user, path: ':user' do
    resources :boards, as: :board, path: ':board'
  end

  get '/dashboard', to: 'users#show'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/edit', to: 'users#edit'
  # post 'users', to: 'users#create'

end
