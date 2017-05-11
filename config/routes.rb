Rails.application.routes.draw do
  resources :pages
  root 'my_notes#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  get 'hashtag/:name' => 'posts#hashtag'
  get 'replies/:id/back' => 'replies#back', as: :replies_back
  get 'posts/add' => 'posts#add', as: :add_post
  get 'posts/scrap/:id' => 'posts#scrap_new', as: :scrap_new

  post 'my_notes/:my_note_id/delete_post/:id' => 'my_notes#delete_post', as: :delete_post
  post 'posts/append' => 'posts#append', as: :append_post
  post 'posts/like' => 'posts#like', as: :like_post
  post 'posts/scrap' => 'posts#scrap', as: :scrap
  post 'my_pages/friend' => 'my_pages#friend', as: :friend
  post 'my_pages/accept' => 'my_pages#accept', as: :accept
  post 'my_notes/share' => 'my_notes#share', as: :share

  devise_for :users
  resources :books do
    resources :posts, shallow: true do
      resources :replies, shallow: true
    end
  end
  resources :my_pages
  resources :my_notes do
    collection { post :sort }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
