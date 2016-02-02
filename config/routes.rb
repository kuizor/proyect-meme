Rails.application.routes.draw do
	resources :users, only: [:index, :create, :show, :update, :destroy]
	resources :memes, only: [:index, :create, :show, :destroy]
	resources :categories, only: [:index, :create, :show, :update, :destroy]
  	resources :tags, only: [:index, :create, :show, :update, :destroy]

  	get	'login' => 'sessions#create'
  	get	'logout' => 'sessions#destroy'
end
