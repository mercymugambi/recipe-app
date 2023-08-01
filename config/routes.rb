Rails.application.routes.draw do
  resources :foods
  devise_for :users

  root 'home#index'

  resources :home, only: [:index] 

end
