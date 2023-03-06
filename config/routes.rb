Rails.application.routes.draw do
  resources :laptops
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "laptops#index"
end
