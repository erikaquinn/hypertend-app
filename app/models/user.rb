class User < ApplicationRecord
  has_secure_password
  
  has_many :food_items
  has_many :meals
  has_many :bp_meals
  has_many :blood_pressures

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def friendly_created_at
    created_at.strftime("%B %e, %Y")  
  end
end
