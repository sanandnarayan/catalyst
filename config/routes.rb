Catalyst::Application.routes.draw do
  resources :projects do
    resources :stories
    resources :sprints
  end
  devise_for :users
  root :to => "home#index"
end
