Rails.application.routes.draw do
  resources :profiles
  resources :books
  resources :authors
  resources :tags, only: %i[index]
end
