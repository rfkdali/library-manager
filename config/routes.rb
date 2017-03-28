Rails.application.routes.draw do
  get 'home/index'

  root "home#index"

  resources :loans do
    member do
      put :book_return, to: 'loans#book_return'
    end
  end
end
