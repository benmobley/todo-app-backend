Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  get "/todos" => "todos#index"
  post "/todos" => "todos#create"
  get "/todos/:id" => "todos#show"
  patch "/todos/:id" => "todos#update"
  delete "/todos/:id" => "todos#destroy"

  get "/categories" => "categories#index"
  post "/categories" => "categories#create"
  get "/categories/:id" => "categories#show"
  patch "/categories/:id" => "categories#update"
  delete "/categories/:id" => "categories#destroy"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"
  delete "/sessions" => "sessions#destroy"
end
