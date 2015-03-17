Rails.application.routes.draw do
  root "menu#index"

  get "/menu", to: "menu#index"
  get "/account", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  scope :menu, as: "menu" do
    resources :items, param: :item_name
    resources :categories, param: :category_name
  end

  scope :admin, as: "admin" do
    get "/dashboard", to: "admin#show"
  end

  resources :cart_items, only: [:create, :destroy]
  get "/cart", to: "cart_items#index"

  resources :orders
end
