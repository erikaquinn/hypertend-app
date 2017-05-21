class GraphsController < ApplicationController
  def index
    # @user_meals = Meal.where(user_id: current_user.id).group_by_day_of_week(:created_at).sum(:sodium_total)
    @date_range = "#{(Date.today - 6).strftime("%b %e")} - #{DateTime.now.strftime("%b %e")}" 
    @current_user = current_user
  end
end
