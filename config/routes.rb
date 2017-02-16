Rails.application.routes.draw do
  root 'books#index'

  resources :chapters
  resources :opinions
  resources :books
  resources :quotes
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
