Catalyst::Application.routes.draw do
  get "projects/new"
  devise_for :users
  root :to => "home#index"
  resources :projects
end
