Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # Temporarily comment this out until Devise is properly installed
  # devise_for :users
  
  root 'home#index'

  get 'about', to: 'about#index'
  get 'books', to: 'books#show_all'
  get 'magazines', to: 'magazines#show_all'
  get 'login', to: 'sessions#new'
  resources :authors, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :publishers, only: [:index, :show]

  resources :books, only: [:show] do
    resources :reviews, only: [:create]
    resources :magazines, only: [:show], controller: 'books/magazines'
  end

  resources :magazines, only: [:show]

  # Routes for showing the search
  resources :books do
    collection do
      get 'show_all' 
    end
  end

  resources :magazines do
    collection do
      get 'show_all' 
    end
  end
end