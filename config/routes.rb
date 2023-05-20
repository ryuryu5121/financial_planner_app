Rails.application.routes.draw do
  get 'fp_sessions/new'
  get 'financial_planner/new'
  get 'financial_planner/show'
  get 'new/show'
  root 'top_pages#home'
  get 'reservations/index'
  get 'reservations/new'
  get 'reservations/show'
  get    "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get    "/fpsignup",  to: "financial_planners#new"
  get    "/fplogin",   to: "fp_sessions#new"
  post   "/fplogin",   to: "fp_sessions#create"
  delete "/fplogout",  to: "fp_sessions#destroy"
  resources :reservations
  resources :users
  resources :financial_planners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
