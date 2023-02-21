Rails.application.routes.draw do
  get "users/new"
  devise_for :users
  root "articles#index"
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"
  #admin page
  get "admin/comment" => "admin_pages#comments"
  get "admin" => "admin_pages#articles"
  # get "admin/article" => "admin_pages#articles"
  get "admin/user" => "admin_pages#users"
  resources :users

  resources :articles do
    resources :comments
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
