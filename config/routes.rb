Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :articles do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    delete '/unlike' => 'likes#destroy'
  end

  resources :users, only: [:show] do
    resources :articles, only: [:index]
  end

  root 'articles#index'
end
