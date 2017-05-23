class FoodItemsController < ApplicationController
  def index

    sort_attribute = params[:sort_by] || "created_at"
    sort_attribute_order = params[:sort_order] || "desc"

    @food_items = FoodItem.all.order(sort_attribute => sort_attribute_order)

    render "index.html.erb" 
  end

  def show
    food_item_id = params[:id]
    @food_item = FoodItem.find_by(id: food_item_id)
    render "show.html.erb"
  end

  def create
    food_item = FoodItem.new(
      description: params[:description],
      sodium:      params[:sodium],
      calories:    params[:calories],
      cholesterol: params[:cholesterol],
      protein:     params[:protein],
      potassium:   params[:potassium],
      sugar:       params[:sugar],
      notes:       params[:notes],
      user_id:     current_user.id
    )

    # Search for the meal to insert the meal.id into the new food_item
    meal = Meal.where(:name => params[:meal_name], :created_at => (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)).first

    if meal
      # If the meal is found, insert the meal.id into food_item and save
      food_item[:meal_id] = meal.id

      # Then update the meal's totals using the food_item's params
      meal.update(
        sodium_total:      meal.sodium_total + params[:sodium].to_i,
        calories_total:    meal.calories_total + params[:calories].to_i,
        cholesterol_total: meal.cholesterol_total + params[:cholesterol].to_i,
        protein_total:     meal.protein_total + params[:protein].to_i,
        potassium_total:   meal.potassium_total + params[:potassium].to_i,
        sugar_total:       meal.sugar_total + params[:sugar].to_i
      ) 
    else
      new_meal = Meal.new(
        name:              params[:meal_name],
        sodium_total:      params[:sodium],
        calories_total:    params[:calories],
        cholesterol_total: params[:cholesterol],
        protein_total:     params[:protein],
        potassium_total:   params[:potassium],
        sugar_total:       params[:sugar],
        user_id:           current_user.id
      )
      new_meal.save
      food_item[:meal_id] = new_meal.id
    end
    
    food_item.save

    flash[:success] = "Item sucessfully added!"
    redirect_to "/food_items"
  end

  def edit
    food_item_id = params[:id]
    @food_item = FoodItem.find_by(id: food_item_id)
    render "edit.html.erb"
  end

  def update
    food_item_id = params[:id]
    @food_item = FoodItem.find_by(id: food_item_id)

    meal = Meal.find(@food_item.meal_id)

    sodium_param_num      = params[:sodium] ? params[:sodium].to_i : 0
    calories_param_num    = params[:calories] ? params[:calories].to_i : 0
    cholesterol_param_num = params[:cholesterol] ? params[:cholesterol].to_i : 0
    protein_param_num     = params[:protein] ? params[:protein].to_i : 0
    potassium_param_num   = params[:potassium] ? params[:potassium].to_i : 0
    sugar_param_num       = params[:sugar] ? params[:sugar].to_i : 0

    meal.update(
      sodium_total:      meal.sodium_total - @food_item.sodium + sodium_param_num,
      calories_total:    meal.calories_total - @food_item.calories + calories_param_num,
      cholesterol_total: meal.cholesterol_total - @food_item.cholesterol + cholesterol_param_num,
      protein_total:     meal.protein_total - @food_item.protein + protein_param_num,
      potassium_total:   meal.potassium_total - @food_item.potassium + potassium_param_num,
      sugar_total:       meal.sugar_total - @food_item.sugar + sugar_param_num
    )

    @food_item.update(
      description: params[:description],
      sodium:      params[:sodium],
      calories:    params[:calories],
      cholesterol: params[:cholesterol],
      protein:     params[:protein],
      potassium:   params[:potassium],
      sugar:       params[:sugar],
      notes:       params[:notes]
    )

    flash[:success] = "Item sucessfully updated!"
    redirect_to "/food_items/#{@food_item.id}"
  end
end
