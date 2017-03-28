Rails.application.routes.draw do
  resources :loans 

  get 'home/index'

  root "home#index"
end
