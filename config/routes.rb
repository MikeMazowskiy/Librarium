Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :profiles
  resources :lists
  resources :authors
  resources :tags, only: %i[index]
  resources :comments, only: [:show, :edit, :update, :destroy]

  resources :books do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :reviews, only: [:show, :edit, :update, :destroy] do
    resources :comments, only: [:index, :new, :create]
  end
end
