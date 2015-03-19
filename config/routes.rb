Rails.application.routes.draw do
  root "sessions#index"

  get "/menu", to: "menu#index"
  get "/account", to: "users#show"
  get "/", to: "sessions#index"
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

  resources :cart_items, only: [:create, :update, :destroy]
  get "/cart", to: "cart_items#index"
  post "/checkout", to: "orders#create"

  resources :orders do
    member do # for an individual order
      get "cancel"
      get "paid"
      get "complete"
    end
  end

  get "errors/file_not_found"
  get "errors/unprocessable"
  get "errors/internal_server_error"

  match "/404", to: "errors#file_not_found", via: :all
  match "/422", to: "errors#unprocessable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
