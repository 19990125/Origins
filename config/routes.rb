Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'homes/top' => 'homes#top'
  get 'submissions/search' => 'submissions#search'
  get 'submissions/new' => 'submissions#new'
  resources :submissions, only: %i[index show create destroy] do
    resources :favorites, only: %i[index create destroy]
  end
  get 'users/unsubscribe' => 'users#unsubscribe'
  resources :users, only: %i[show edit destroy update] do
    get 'submissions' => 'favorites#index'
    resources :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
