Rails.application.routes.draw do
  get 'search' => 'searches#search'
  devise_for :users
  root to: 'homes#top'
  resources :posts, except: [:index] do
    resource :favorites, only: %i[create destroy]
    resources :post_comments, only: %i[create edit update destroy]
  end
  resources :users, only: %i[show edit update destroy] do
    get 'favorites' => 'users#favorites'
  end
  get 'confirm' => 'users#confirm'
  resources :contacts, only: %i[new create]
  post 'confirm' => 'contacts#confirm'
  post 'back' => 'contacts#back'
  get 'done' => 'contacts#done'
  resources :tags do
    get 'posts' => 'posts#search'
  end
end
