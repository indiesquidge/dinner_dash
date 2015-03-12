Rails.application.routes.draw do
  get "/menu", to: "menu#index"

  scope :menu, as: "menu" do
    resources :items, param: :item_name
    resources :categories, param: :category_name
  end
end
