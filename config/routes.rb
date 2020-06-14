Rails.application.routes.draw do
  mount Mercury::Engine => '/'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :articles do
		member { post :mercury_update }
		resources :comments
		end
		# put 'articles/:id/mercury_update', to: 'articles#mercury_update'
	# resources :pages do
  	# member { post :mercury_update }
	# end
	root 'articles#index'

end
