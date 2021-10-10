Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :posts, except: [:index]
  get 'tag_search' => 'posts#tag_search'
  resources :users, only: [:show, :edit, :update, :destroy]
  post 'confirm' => 'users#confirm'

end
