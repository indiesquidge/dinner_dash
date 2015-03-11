Rails.application.routes.draw do
  get '/menu', to: 'items#index'
end
