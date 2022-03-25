Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'inventories/index'
  get 'generates_recipe/index'
  # get 'users/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :public_recipes, only: [:index]

  resources :recipes, only: [:index, :new, :create, :destroy, :show, :update]
  resources :inventories, only: [:index, :new, :create, :destroy, :show]
  resources :generates_recipe, only: [:index, :show, :update]
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :foods, only: [:index, :create, :new, :destroy]
end
