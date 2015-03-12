Rails.application.routes.draw do
  get "/menu", to: "menu#index"
  scope :menu, as: "menu" do
    resources :items, param: :item_name
    resources :categories, param: :category_name
  end

  resources :cart_items, only: [:create]
  get "/cart", to: "cart_items#index"

  get "/account", to: "users#show"
  get "/login", to: "sessions#new"
end
