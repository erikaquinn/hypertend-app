class CreateBloodPressures < ActiveRecord::Migration[5.0]
  def change
    create_table :blood_pressures do |t|
      t.integer :systolic_number
      t.integer :diastolic_number
      t.integer :bpm
      t.string :measurement_arm
      t.integer :weight
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
