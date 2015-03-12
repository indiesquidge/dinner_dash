Rails.application.routes.draw do
  get "/menu", to: "menu#index"

  namespace :menu do
    resources :item, as: :item_name
    resources :category, as: :category_name
  end
end
