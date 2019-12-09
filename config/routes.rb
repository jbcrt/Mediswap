Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :confirmations => "users/confirmations",
    :passwords => "users/passwords",
    :registrations => "users/registrations",
    :sessions => "users/sessions",
    :unlocks => "users/unlocks",
  }
  
  root to: 'pages#home'
  
  get 'contact', to: 'pages#contact', as: :contact
  get 'terms', to: 'pages#terms', as: :terms
  get 'privacy', to: 'pages#privacy', as: :privacy
  
  resources :offers , only: [:index, :show, :new, :create]

  namespace :my do
    resources :offers,  only: [:index, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
