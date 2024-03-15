Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :pets, except: [:new]
  resources :clinics, only: [:new, :create, :index, :show, :edit, :update] do
    resources :appointments, only: [:new, :create]
  end
  resources :vets, except: [:new] do
    member do
      get :appointments_list
    end
  end
  resources :appointments, only: [:index] do
    resources :records, only: [:create]
    resources :reviews, only: [:new, :create]
  end
  resources :tutors, only: [:new, :create, :show, :edit, :update]  
end
