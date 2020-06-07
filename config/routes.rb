Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :articles do
		resources :comments
	end	
	root 'articles#index'
end
