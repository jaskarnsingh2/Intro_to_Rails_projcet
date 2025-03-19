Rails.application.routes.draw do
  root 'home#index'

  get 'about', to: 'about#index'
  
  # Books routes
  resources :books, only: [:show] do
    resources :magazines, only: [:show], controller: 'books/magazines'
  end
  
  resources :books, only: [:index, :show] do
    collection do
      get 'show_all'
    end
  end

  # Magazines routes
  resources :magazines, only: [:show] do
    collection do
      get 'show_all'
    end
  end
  
  # Authors routes
  resources :authors, only: [:index, :show]

  # Categories routes
  resources :categories, only: [:index, :show]

  # Publishers routes
  resources :publishers, only: [:index, :show]

  # Reviews routes
  resources :reviews, only: [:create, :destroy]

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
