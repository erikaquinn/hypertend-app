class BloodPressure < ApplicationRecord
  belongs_to :user
  has_many :bp_meals

  def friendly_created_at
    created_at.strftime("%B %e, %Y")  
  end
end
