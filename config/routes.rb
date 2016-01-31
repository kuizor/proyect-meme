Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :update, :destroy]
  root :to => "home#index"
end
