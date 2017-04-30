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

  def new
    render "new.html.erb"
  end
end
