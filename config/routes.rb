Rails.application.routes.draw do
  get "/" => "food_items#index"
  get "/food_items" => "food_items#index"

  get "/food_items/new" => "food_items#new"
  post "/food_items" => "food_items#create"
  get "/food_items/:id" => "food_items#show"
  get "/food_items/:id/edit" => "food_items#edit"
  patch "/food_items/:id" => "food_items#update"

  get "/meals" => "meals#index"
  get "/meals/:id" => "meals#show"

  get "/blood_pressures" => "blood_pressures#index"
  get "/blood_pressures/new" => "blood_pressures#new"
  post "/blood_pressures" => "blood_pressures#create"
  get "/blood_pressures/:id" => "blood_pressures#show"
  get "/blood_pressures/:id/edit" => "blood_pressures#edit"
  patch "/blood_pressures/:id" => "blood_pressures#update"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
