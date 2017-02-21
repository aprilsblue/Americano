Rails.application.routes.draw do
  resources :replies
  resources :posts
  root 'books#index'

  devise_for :users
  resources :books
  get 'posts/:id/hashtags/:name' => 'posts#hashtag'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
