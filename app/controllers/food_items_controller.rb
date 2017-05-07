class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all
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
      sodium: params[:sodium],
      calories: params[:calories],
      cholesterol: params[:cholesterol],
      potassium: params[:potassium],
      sugars: params[:sugars],
      notes: params[:notes],
      meal_id: params[:meal_id],
      user_id: current_user.id
    )
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
    @description = params[:description]
    @sodium = params[:sodium]
    @calories = params[:calories]
    @cholesterol = params[:cholesterol]
    @potassium = params[:potassium]
    @sugars = params[:sugars]
    @notes = params[:notes]
    @meal_id = params[:meal_id]
    
    food_item.save
    flash[:success] = "Item sucessfully updated!"
    redirect_to "/food_items/#{@food_item.id}"
  end
end
