Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :articles

  resources :users, only: [:show] do
    resources :articles, only: [:index]
  end

  root 'articles#index'
end
