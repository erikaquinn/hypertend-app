class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :sodium_total
      t.integer :calories_total
      t.integer :cholesterol_total
      t.integer :protein_total
      t.integer :potassium_total
      t.integer :sugar_total
      t.integer :bp_meal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
