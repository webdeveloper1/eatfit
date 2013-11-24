Eatfit2::Application.routes.draw do


	root 'pages#front'

	as :user do
		get "/login" => "devise/sessions#new"
		delete "/logout" => "devise/sessions#destroy"
		get "/signup" => "devise/registrations#new"
		get "/account" => "devise/registrations#edit"
	end

	resources :meals, only: [:show, :new, :create, :destroy] do
		resources :comments, only: [:new, :create]
		member do
			post 'vote'
		end
	end

	namespace :admin do
		resources :overviews, only: [:index] do
			get 'users', on: :collection
			get 'meals', on: :collection
			get 'comments', on: :collection
		end
	end

	resources :relationships, only: [:create, :destroy]
	resources :feeds
	get 'search', to: 'search#search'
	post 'search', to: 'search#result'
	get 'friends', to: 'relationships#index'

	get 'upload', to: 'dashboards#show'
	get 'contact', to: 'contact_messages#new'
	get 'timeline', to: 'timelines#show'
	get 'trending', to: 'showcases#index'

	post 'share_meal', to: 'meals#share'

	resources :contact_messages, only: [:create]

	get ':username', to: 'timelines#show', as: :user
	devise_for :users
end
