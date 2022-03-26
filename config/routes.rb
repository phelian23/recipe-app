Rails.application.routes.draw do
  get 'recipe_foods/index'
  get 'inventory_foods/index'
  get 'general_shopping_lists/index'
  get 'public_recipes/index'
  get 'inventories/index'
  # get 'recipes/index'
  # get 'users/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :public_recipes, only: [:index]

  resources :recipes, only: [:index, :new, :create, :destroy, :show, :update] do
    resources :recipe_foods, only: [:new, :create, :destroy]
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
