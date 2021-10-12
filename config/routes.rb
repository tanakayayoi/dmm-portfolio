Rails.application.routes.draw do

  get 'search' => 'searches#search'
  devise_for :users
  root to: 'homes#top'
  resources :posts, except: [:index] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'confirm' => 'users#confirm'
  resources :contacts, only: [:new, :create]
  post 'confirm' => 'contacts#confirm'
  post 'back' => 'contacts#back'
  get 'done' => 'contacts#done'
  resources :tags do
    get 'posts' => 'posts#search'
  end

end
