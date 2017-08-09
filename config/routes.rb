Rails.application.routes.draw do

  root 'yeahaps#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  get 'hashtag/:name' => 'posts#hashtag'
  get 'yeahaps/:id/change_private' => 'yeahaps#change_private', as: :change_private
  get 'yeahaps/index/:followee_id' => 'yeahaps#followee', as: :followee_page
  get 'yeahaps/move_form/:id' => 'yeahaps#move_form', as: :yeahap_move_form

  post 'my_notes/:my_note_id/delete_post/:id' => 'my_notes#delete_post', as: :delete_post
  post 'my_pages/friend' => 'my_pages#friend', as: :friend
  post 'my_pages/accept' => 'my_pages#accept', as: :accept
  post 'my_notes/share' => 'my_notes#share', as: :share
  post 'yeahaps/create' => 'yeahaps#create'
  post 'yeahaps/getItem' => 'yeahaps#getItem', as: :getItem
  post 'yeahaps/exportBookmark' => "yeahaps#exportBookmark"
  post 'yeahaps/check' => 'yeahaps#check'
  post 'yeahaps/userCheck' => 'yeahaps#userCheck'
  post 'yeahaps/sort' => 'yeahaps#sort'
  post 'yeahaps/move/:id' => 'yeahaps#move', as: :yeahap_move
  post 'yeahapboxes/update' => 'yeahapboxes#update'
  post 'yeahapboxes/sort' => 'yeahapboxes#sort'
  post 'yeahapboxes/destroy' => 'yeahapboxes#destroy'

  delete 'my_pages/destroy/:id' => 'my_pages#destroy', as: :destroy_followee

  devise_for :admins, path: '/yeahapadmin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :yeahaps, except: [:create, :new, :show]
  resources :yeahapboxes, except: [:destroy, :index, :edit, :show]
  resources :pages, only: [:create, :new]
  resources :my_pages
  resources :my_notes do
    collection { post :sort }
  end
  resources :notices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
