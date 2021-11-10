Rails.application.routes.draw do
 devise_for :users
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 get 'homes/top' => "homes#top"
 get 'submissions/search' => "submissions#search"
 get 'submissions/new' => "submissions#new"
 resources :submissions,only: [:index,:show,:create,:destroy]
 get 'users/unsubscribe' => "users#unsubscribe"
 resources :users,only: [:show,:edit,:destroy,:update] do
   resources :relationships,only: [:create,:destroy]
   get 'followings' => 'relationships#followings', as: 'followings'
   get 'followers' => 'relationships#followers', as: 'followers'
   resources :favorites,only: [:index,:create,:destroy]
 end
end