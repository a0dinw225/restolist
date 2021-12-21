Rails.application.routes.draw do
  root to: 'toppages#index'
  
  resources :restaurants, only: [:index, :show] do
    resources :posts, only: [:create, :destroy]
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post 'guest_login', to: 'guest_sessions#create'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create] do
    member do
      get :likes
    end
  end
  resources :likes, only: [:create, :destroy]
  resources :posts, only: [:create, :destroy]
end
