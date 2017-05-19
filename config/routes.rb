Rails.application.routes.draw do

  root 'yeahaps#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  get 'hashtag/:name' => 'posts#hashtag'

  post 'my_notes/:my_note_id/delete_post/:id' => 'my_notes#delete_post', as: :delete_post
  post 'my_pages/friend' => 'my_pages#friend', as: :friend
  post 'my_pages/accept' => 'my_pages#accept', as: :accept
  post 'my_notes/share' => 'my_notes#share', as: :share

  devise_for :users
  resources :yeahapbox, only: [:create, :new, :edit, :update, :destroy]
  resources :yeahaps, except: [:create, :new, :show]
  resources :pages, only: [:create, :new]
  resources :my_pages
  resources :my_notes do
    collection { post :sort }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
