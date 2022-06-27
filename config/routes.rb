Rails.application.routes.draw do
  resources :items
  get 'users/show'
  devise_for :users
  root "items#index"

  get "/payments/success", to: "payments#success"
  # post "/payments/webhook", to: "payments#webhook"

end
