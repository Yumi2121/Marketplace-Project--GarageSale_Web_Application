Rails.application.routes.draw do
  get 'orders/bought'
  get 'orders/sold'
  resources :items
  get 'users/show'
  devise_for :users
  root "items#index"

  post "items/:id/order", to: "items#place_order", as: "place_order"

  get "/payments/success", to: "payments#success"
  # post "/payments/webhook", to: "payments#webhook"

end
