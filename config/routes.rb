Rails.application.routes.draw do
  # ActiveAdmin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Main routes
  root "catalog#index"
  devise_for :customers, :controllers => { registrations: 'customers/registrations' }

  resources :catalog do
    collection do
      get :show_years
      get :show_models
      get :show_categories
      get :show_types
      get :show_products
    end
  end
  get "search", to: "catalog#search", as: "search_catalog"

  get "product/:id", to: "product#show", as: "product"

  get "cart", to: "cart#index", as: "cart"
  post "cart/add/:id", to: "cart#add_to_cart", as: "add_to_cart"
  delete "cart/delete/:id", to: "cart#delete_from_cart", as: "delete_from_cart"
  post "cart/update/:id", to: "cart#update_cart_quantity", as: "update_cart_quantity"

  get "checkout", to: "checkout#index", as: "checkout"
  get "checkout/totals", to: "checkout#totals", as: "checkout_totals"
  post "checkout/place_order", to: "checkout#place_order", as: "checkout_place_order"
  get "checkout/success", to: "checkout#success", as: "checkout_success"
end
