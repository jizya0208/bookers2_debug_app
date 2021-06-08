Rails.application.routes.draw do
  resources :messages, :only => [:create]
  resources :rooms, :only => [:show, :create]
  get 'rooms/show'
  get 'search/search'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :groups do
    resource :group_users, only: [:create, :destroy]
  end
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search', to: 'search#search'
  
end