Rails.application.routes.draw do

  root 'yeahaps#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  get 'hashtag/:name' => 'posts#hashtag'
  get 'posts/test' => 'posts#test'

  post 'my_notes/:my_note_id/delete_post/:id' => 'my_notes#delete_post', as: :delete_post
  post 'my_pages/friend' => 'my_pages#friend', as: :friend
  post 'my_pages/accept' => 'my_pages#accept', as: :accept
  post 'my_notes/share' => 'my_notes#share', as: :share
  post 'posts/test' => 'posts#test'

  devise_for :users
  resources :yeahaps, except: [:create, :new, :show]
  resources :pages
  resources :my_pages
  resources :my_notes do
    collection { post :sort }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
