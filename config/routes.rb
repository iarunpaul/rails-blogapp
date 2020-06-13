Rails.application.routes.draw do
  mount Mercury::Engine => '/'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :articles do
		resources :comments
		end
	resources :pages do
  member { post :mercury_update }
	end
	root 'pages#index'
	get 'pages/show', to: 'pages#index'
end
