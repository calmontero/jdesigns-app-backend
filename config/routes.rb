Rails.application.routes.draw do
  resources :jobs do
    resources :images, only: [:show, :index, :create, :destroy]
  end
   
  resources :testimonials
  resources :downloads
  resources :designs
  resources :users, only: [:show]
  
  # Login/Logout Session
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/me", to: "users#show"
  get "/users", to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
