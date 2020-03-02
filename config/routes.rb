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

  namespace :account do
    resources :offers,  only: [:index, :edit, :update, :destroy]
    resources :facilities,  only: [:edit, :update]
  end

  delete 'account/facilities/:id/delete_facility_attachment/:attachment_id', to: 'account/facilities#delete_facility_attachment', as: :delete_facility_attachment

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
