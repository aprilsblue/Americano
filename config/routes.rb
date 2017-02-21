Rails.application.routes.draw do
  root 'books#index'

  devise_for :users
  resources :books do
    resources :posts, shallow: true do
      resources :replies, shallow: true
    end
  end
  get 'posts/:id/hashtags/:name' => 'posts#hashtag'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
