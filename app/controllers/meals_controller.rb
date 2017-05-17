class MealsController < ApplicationController
  def index
    @meals = Meal.all
    render "index.html.erb"
  end

  def show
    @meal = Meal.all
    meal_id = params[:id]
    @meal = Meal.find_by(id: meal_id)
    render "show.html.erb"
  end
end
