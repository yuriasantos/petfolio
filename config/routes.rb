Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :pets, only: [:new, :create, :show]
  resources :clinics, only: [:new, :create]
  resources :tutors, only: [:new, :create]
  resources :vets, only: %i[new create]
end
