Rails.application.routes.draw do
  get "users/new"
  devise_for :users
  root "articles#index"
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "admin_comments" => "admin_pages#comments"
  get "admin_articles" => "admin_pages#articles"
  get "admin_users" => "admin_pages#users"
  #get "signup"  => "users#new"
  resources :users

  resources :articles do
    resources :comments
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
