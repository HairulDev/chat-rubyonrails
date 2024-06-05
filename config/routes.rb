Rails.application.routes.draw do
  # action cable server
  mount ActionCable.server => '/cable'

  resources :messages
  resources :users
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
