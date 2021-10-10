Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :posts
  get 'tag_search' => 'posts#tag_search'
end
