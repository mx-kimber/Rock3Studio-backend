Rails.application.routes.draw do
  

  get "up" => "rails/health#show", as: :rails_health_check
  resources :photos
  resources :rocks
  resources :users
    post "/sessions" => "sessions#create"
end
