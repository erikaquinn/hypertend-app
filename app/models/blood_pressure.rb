class BloodPressure < ApplicationRecord
  belongs_to :user
  has_many :bp_meals
end
