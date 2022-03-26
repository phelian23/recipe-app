Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :public_recipes, only: [:index]

  resources :recipes, only: [:index, :new, :create, :destroy, :show, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
    resources :general_shopping_lists, only: [:index]
  end
  resources :inventories, only: [:index, :new, :create, :destroy, :show] do
    resources :inventory_foods, only: [:new, :create, :destroy]
  end
  
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :foods, only: [:index, :create, :new, :destroy]
end
