Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :articles
  resources :comments, only: [:create, :destroy]

  resources :users, only: [:show] do
    resources :articles, only: [:index]
  end

  root 'articles#index'
end
