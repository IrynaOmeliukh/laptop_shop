Rails.application.routes.draw do
  get 'laptop_compare/index'
  get 'favorite_items/index'

  resources :laptops
  post 'laptops/add_to_favorites/:id', to: 'laptops#add_to_favorites', as: 'add_to_favorites'
  delete 'laptops/remove_from_favorites/:id', to: 'laptops#remove_from_favorites', as: 'remove_from_favorites'

  post 'laptops/add_to_comparing/:id', to: 'laptops#add_to_comparing', as: 'add_to_comparing'
  delete 'laptops/remove_from_comparing/:id', to: 'laptops#remove_from_comparing', as: 'remove_from_comparing'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "laptops#index"
end
