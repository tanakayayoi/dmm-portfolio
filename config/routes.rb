Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :posts, except: [:index] do
    resources :post_comments, only: [:create, :edit, :update, :destroy]
  end
  get 'tag_search' => 'posts#tag_search'
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'confirm' => 'users#confirm'

end
