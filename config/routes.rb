Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"

  get 'cadastro', to: 'users#new'
  get 'entrar',   to: 'sessions#new'
  post 'entrar',  to: 'sessions#create'
  delete 'sair',  to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create, :edit, :update] do
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :sessions, only: [:new, :create, :destroy]


end
