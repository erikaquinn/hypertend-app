class BpMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  belongs_to :blood_pressure
end
