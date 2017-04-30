Rails.application.routes.draw do
  get "/" => "food_items#index"
  get "/food_items/new" => "food_items#new"
  get "/food_items/:id" => "food_items#show"

  get "/meals" => "meals#index"
  get "/meals/:id" => "meals#show"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
