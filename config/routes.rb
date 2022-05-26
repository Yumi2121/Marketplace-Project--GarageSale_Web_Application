Rails.application.routes.draw do
  resources :items
  get 'users/show'
  devise_for :users
  root "items#index"

end
