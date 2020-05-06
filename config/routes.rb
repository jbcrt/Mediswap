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
  get 'offers/new_offer', to: 'pages#new_offer', as: :new_offer
  
  resources :offers , only: [:index, :show]
  resources :replacements, controller: :offers, type: 'Replacement', only: [:new, :create]
  resources :employments, controller: :offers, type: 'Employment', only: [:new, :create]
  resources :collaborations, controller: :offers, type: 'Collaboration', only: [:new, :create]
  resources :patient_transfers, controller: :offers, type: 'PatientTransfer', only: [:new, :create]
  resources :establishments, controller: :offers, type: 'Establishment', only: [:new, :create]

  namespace :account do
    resources :offers,  only: [:index, :edit, :update, :destroy]
    resources :facilities,  only: [:edit, :update]
  end

  delete 'account/facilities/:id/delete_facility_attachment/:attachment_id', to: 'account/facilities#delete_facility_attachment', as: :delete_facility_attachment

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
