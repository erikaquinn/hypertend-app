class FoodItem < ApplicationRecord
  belongs_to :meal
  # belongs_to :bp_meal

  def friendly_created_at
    created_at.strftime("%B %e, %Y")  
  end
end
