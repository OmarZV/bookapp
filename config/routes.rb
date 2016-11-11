Rails.application.routes.draw do
  resources :chatrooms do
  	resource :chatroom_users
  	resources :messages
  end
  resources :direct_messages
  resources :events
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :controllers => "users_controller.rb"
  resources :users do
  	resource :ranking, module: :users
  	member do
  		post :follow
  	end
  end
  resources :books do  	
  	resource :like, module: :books
  	member do
  		post :bookmark
  	end
  end
  
  root to: "events#index"
 
end
