Rails.application.routes.draw do
	resources :users, only: [:index, :create, :show, :update, :destroy]
	resources :memes, only: [:index, :create, :show, :destroy]
	resources :categories, only: [:index, :create, :show, :update, :destroy]
  	resources :tags, only: [:index, :create, :show, :update, :destroy]
  	resources :emails, only: [:index, :create]

  	get	'login' => 'sessions#create'
  	get	'logout' => 'sessions#destroy'
  	get 'privated' => 'memes#meme_privated'
  	get 'public' => 'memes#meme_public'
  	#get 'send' => 'emails#create'
end