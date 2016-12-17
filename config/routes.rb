Rails.application.routes.draw do
  get '/profile', to: 'profile#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'pins#index'

  resources :comments

  resources :pins, path: 'pin'

  resources :users, only: [:new, :create, :edit, :update]

  get '/:user', to: 'users#show', as: 'show_user'

  namespace :users, as: :user, path: ":user" do
    get '/:board', to: 'boards#show', as: 'board'
    get '/following', to: 'relationships#following', as: 'following'
    get '/followers', to: 'relationships#followers', as: 'followers'
  end

  resources :relationships
  get '/dashboard', to: 'users#show'

end
