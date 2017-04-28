Rails.application.routes.draw do
  get "/" => "food_items#index"

  get "/signup" => "users#new"
  post "/users" => "users#create"
end
