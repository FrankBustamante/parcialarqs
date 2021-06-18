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
      get :wish_list
      post :marked_wish
  	end
  end

  resources :pages, only: [] do
    collection do
      get :profile
      patch :update_profile
    end
  end

  resources :authors
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
