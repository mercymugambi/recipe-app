Rails.application.routes.draw do
  devise_for :users
  
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'home/index'
  
  get 'home/index'
  root 'home#index'
end
