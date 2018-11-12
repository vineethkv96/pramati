Rails.application.routes.draw do
  
  root "games#index"
  # post "user" => "user#login"
  # get "login" => "login"
  resources :user
  resources :login
  resources :games
  resources :interests
  resources :stadiums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
