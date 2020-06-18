Rails.application.routes.draw do
  get 'pages/home'

  mount Mercury::Engine => '/'

  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users

	resources :articles, only: [:index, :show, :new, :create, :destroy] do
		member { post :mercury_update }
		resources :comments, only: [:index, :new, :create]
	end
	resources :comments, only: :destroy
		# put 'articles/:id/mercury_update', to: 'articles#mercury_update'
	# resources :pages do
  	# member { post :mercury_update }
	# end
	root 'pages#home'

end
