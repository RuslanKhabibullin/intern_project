Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations",
                                    omniauth_callbacks: "users/omniauth_callbacks" }

  resources :articles do
    resources :comments, only: %i(create destroy)
    resource :like, only: %i(create destroy)
  end

  resources :users, only: [:show] do
    resources :articles, only: [:index]
  end

  root "articles#index"
end
