class GraphsController < ApplicationController
  def index
    @date_range = "#{(Date.today - 6).strftime("%b %e")} - #{DateTime.now.strftime("%b %e")}" 
    
    # Single series line graph
    @user_meals = Meal.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group_by_day_of_week(:created_at, format: "%a").sum(:sodium_total)
    
    # Multi-series line graph

    systolic_data = BloodPressure.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group_by_day_of_week(:created_at, format: "%a").sum(:systolic_number)

    diastolic_data = BloodPressure.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group_by_day_of_week(:created_at, format: "%a").sum(:diastolic_number)

    # sodium = Meal.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group_by_day_of_week(:created_at, format: "%a").sum(:sodium_total)

    systolic_data_obj = {
      name: "Systolic Number",
      data: systolic_data
    }

    diastolic_data_obj = {
      name: "Diastolic Number",
      data: diastolic_data
    }
    
    @bp_data = [systolic_data_obj, diastolic_data_obj]

    @current_user = current_user


  end
end
