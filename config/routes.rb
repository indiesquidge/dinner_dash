Rails.application.routes.draw do
  get "/menu", to: "items#index"
  resources :cart_items, only: [:create]
  get '/cart', to: "cart_items#index"
end
