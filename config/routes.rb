RottenMangoes::Application.routes.draw do
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  root to: 'movies#index'

  namespace :admin do
    resources :users, only: [:index, :new, :create, :show, :destroy]
    post 'sessions/:id/alias' => 'sessions#alias', as: :sessions_alias
    post 'sessions/uncloak' => 'sessions#uncloak', as: :sessions_uncloak
  end
end
