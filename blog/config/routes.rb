Blog::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get "sessions/new"

  resources :posts do
    resources :images
  end

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :home
  #resources :posts
  resources :sessions

  root :to => "home#index"
end
