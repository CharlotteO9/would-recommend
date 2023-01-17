Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root to: "pages#home" -> besoin de ne pas nester pour pouvoir avoir ma page "new recommendation"
  # resources :communities, only: [:index, :show, :new, :create, :destroy] do
  #   resources :recommendations do
  #     resources :ratings, only: [:create]
  #   end
  # end

  root to: "pages#home"
  resources :communities, only: [:index, :show, :new, :create, :destroy] do
    resources :recommendations
  end

  # resources :recommendations, only: [:show] do
  #   resources :ratings, only: [:create]
  # end
end
