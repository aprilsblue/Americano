Rails.application.routes.draw do
  root 'books#landing'

  get 'books/landing'
  get 'hashtag/:name' => 'posts#hashtag'
  get 'replies/:id/back' => 'replies#back', as: :replies_back

  devise_for :users
  resources :books do
    resources :posts, shallow: true do
      resources :replies, shallow: true
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
