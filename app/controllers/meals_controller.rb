class MealsController < ApplicationController
  def index
    # @meals = Meal.all
    @meals = current_user.meals
    render "index.html.erb"
  end

  def show
    @meals = Meal.all
    meal_id = params[:id]
    @meals = Meal.find_by(id: meal_id)
    render "show.html.erb"
  end
end
