class CreateBpMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :bp_meals do |t|
      t.integer :meal_id
      t.integer :blood_pressure_id
      t.integer :user_id

      t.timestamps
    end
  end
end
