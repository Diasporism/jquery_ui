JqueryUi::Application.routes.draw do

  root to: 'forms#index'
  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'login' => 'sessions#new', as: 'login'
  get 'signup' => 'users#new', as: 'signup'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
