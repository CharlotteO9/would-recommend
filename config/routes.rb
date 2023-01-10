Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  resources :communities, only: [:index, :show, :new, :create, :destroy] do
    resources :recommendations, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :ratings, only: [:new]
    end
  end
end
