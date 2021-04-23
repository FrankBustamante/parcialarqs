Rails.application.routes.draw do
  root 'pages#home'

  resources :borrowed_books do
  	collection do
  		get :user
  	end
  end

  resources :books do
  	collection do
  		get :books_loan
  	end
  end

  resources :authors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
