Rails.application.routes.draw do
	devise_for :users,
   controllers: {
      sessions: 'users/sessions',
      registrations: "users/registrations",
      omniauth_callbacks: 'users/omniauth_callbacks'
   }
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   resources :users,only: [:show,:index,:edit,:update] do
   	# フォロー
   	member do
   		get :following, :followers
   	end
   end
   resources :relationships,only: [:create, :destroy]

   resources :books do
   	# いいね
   	resource :favorites,only: [:create,:destroy]
   	# コメント
   	resource :book_comments, only: [:create]
   end
   root 'home#top'
   get 'home/about' => 'home#about'
   get '/search', to: 'search#search'
end
