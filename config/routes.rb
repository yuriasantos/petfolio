Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :pets, only: [:new, :create, :show]
  resources :clinics, only: [:new, :create, :index, :show, :edit, :update] do
    resources :appointments, only: [:new, :create]
  end
  resources :tutors, only: [:new, :create, :show]
  resources :vets, only: [:new, :create, :show]
  resources :appointments, only: [:index] do
    resources :reviews, only: [:new, :create]
  end
end
