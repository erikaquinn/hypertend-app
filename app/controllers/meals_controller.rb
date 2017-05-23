class MealsController < ApplicationController
  def index

    sort_attribute = params[:sort_by] || "created_at"
    sort_attribute_order = params[:sort_order] || "desc"

    @meals = Meal.all.order(sort_attribute => sort_attribute_order)
    
    render "index.html.erb"
  end

  def show
    @meal = Meal.all
    meal_id = params[:id]
    @meal = Meal.find_by(id: meal_id)
    render "show.html.erb"
  end
end
