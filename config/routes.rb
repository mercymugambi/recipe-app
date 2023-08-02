Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :foods
  devise_for :users

  root 'home#index'

  resources :home, only: [:index]
  resources :recipes do
    resources :recipe_foods, only: [:new, :create]
  end

end
