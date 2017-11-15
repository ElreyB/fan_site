Rails.application.routes.draw do
  root :to => 'genres#index'

  resources :genres do
    resources :books
  end

  resources :books do
    resources :reviews
  end

end
