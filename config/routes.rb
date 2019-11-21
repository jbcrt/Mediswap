Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  root to: 'pages#home'
  get 'contact', to: 'pages#contact', as: :contact
  get 'terms', to: 'pages#terms', as: :terms
  get 'privacy', to: 'pages#privacy', as: :privacy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
