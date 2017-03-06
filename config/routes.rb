Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'books#landing'

  mount Ckeditor::Engine => '/ckeditor'

  get 'books/landing'
  get 'hashtag/:name' => 'posts#hashtag'
  get 'replies/:id/back' => 'replies#back', as: :replies_back
  get 'posts/add' => 'posts#add', as: :add_post
  post 'posts/append' => 'posts#append', as: :append_post
  post 'posts/like' => 'posts#like', as: :like_post

  devise_for :users
  resources :books do
    resources :posts, shallow: true do
      resources :replies, shallow: true
    end
  end
  resources :my_notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
