class Meal < ApplicationRecord
  # has_many :food_items, through: :bp_meals
  has_many :food_items
  has_many :bp_meals

  def friendly_created_at
    created_at.strftime("%B %e, %Y")  
  end
end
