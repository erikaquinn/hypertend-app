class GraphsController < ApplicationController
  def index
    @date_range = "#{(Date.today - 6).strftime("%b %e")} - #{DateTime.now.strftime("%b %e")}" 
    
    ################# Single series line graph #################
    @user_meals = Meal.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group_by_day(:created_at, format: "%a").sum(:sodium_total)




    ################# Pie Chart #################
    weekly_sodium_count = Meal.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group(:name).sum(:sodium_total)

    weekly_sodium_total = weekly_sodium_count["Dinner"] + weekly_sodium_count["Lunch"] + weekly_sodium_count["Breakfast"]

    @pie_chart_data = {
      Breakfast:  ((weekly_sodium_count["Breakfast"].to_f / weekly_sodium_total.to_f) * 100).ceil,
      Lunch:    ((weekly_sodium_count["Lunch"].to_f / weekly_sodium_total.to_f) * 100).ceil,
      Dinner:   ((weekly_sodium_count["Dinner"].to_f / weekly_sodium_total.to_f) * 100).ceil
    }



    ################# Multi-series line graph #################

    systolic_data = BloodPressure.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group_by_day(:created_at, format: "%a").sum(:systolic_number)

    diastolic_data = BloodPressure.where(user_id: current_user.id).where('created_at >= ?', 1.week.ago).group_by_day(:created_at, format: "%a").sum(:diastolic_number)

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
