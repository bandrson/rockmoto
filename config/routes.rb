Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "catalog#index"

  resources :catalog do
    collection do
      get :show_years
      get :show_models
      get :show_categories
      get :show_types
      get :show_products
    end
  end

  get "product/:id", to: "product#show", as: "product"
end
