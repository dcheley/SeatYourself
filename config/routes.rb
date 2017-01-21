Rails.application.routes.draw do
  #/login 'session#new'
  #/logout 'session#destroy'
  root 'pages#home'

  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :owners, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :restaurants, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :reservations, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :reservations, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :restaurants do
    resources :reservations, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :restaurants do
    resources :reviews, only: [:create, :show, :destroy, :edit]
  end

  resources :users do
    resources :reviews, only: [:create, :show, :destroy]
  end

  resources :owners do
    resources :restaurants, only: [:new, :create, :show, :edit, :destroy]
  end

  resources :reservations do
    resources :restaurants, only: [:new, :create, :edit, :update, :destroy]
  end

end
