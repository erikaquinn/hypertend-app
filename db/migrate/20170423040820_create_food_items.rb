class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :description
      t.integer :sodium
      t.integer :calories
      t.integer :cholesterol
      t.integer :protein
      t.integer :potassium
      t.integer :sugar
      t.integer :meal_id
      t.string :notes
      t.integer :bp_meal_id
      t.integer :user_id

      t.timestamps
    end
  end
end
