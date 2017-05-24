ironman = User.create!(
    first_name: 'Tony',
    last_name: 'Stark', 
    email: 'tstark@email.com',
    password: 'password', 
    smoker: 'true'
)

# Days - 28

# Meals - 84 to 100

# Food Items - 168 to 200 
food_sample = ['Steak', 'Coffee', 'Eggs', 'Bacon', 'Toast', 'Chicken Sandwich', 'Tacos', 'Ramen', 'BBQ Ribs', 'Chicken Breast', 'Mashed Potatoes', 'Veggie Salad', 'Chicken Salad', 'Steak Salad', 'English Muffin', 'Bagel', 'Meatball Sub', 'Chicken Alfredo', 'Enchiladas', 'Lasagna', 'French Fries']

sodium_sample       = [10, 50, 75, 100, 150, 200, 250, 300, 500, 600, 1000]
calorie_sample      = [100, 150, 200, 250, 300, 400, 550, 700, 750, 950, 1000]
cholesterol_sample  = [10, 20, 30, 50]
protein_sample      = [10, 15, 18, 20, 22]
potassium_sample    = [0, 10, 15, 20]
sugar_sample        = [10, 20, 30, 40, 50, 100, 120, 150, 200]

snack_sample = ['Potato Chips', 'Bowl of Fruit', 'Pepperoni', 'Eggs', 'Almonds', 'Trail Mix', 'Mini Carrots', 'Fries', 'Ice Cream']
snack_boolean = [true, false]

meal_count = 0
meal_date = Date.new(2017, 4, 25)


# 84 meals
84.times do
  meal_count+=1

  food_item1 = FoodItem.new(
    description: food_sample.sample,
    sodium:      sodium_sample.sample,
    calories:    calorie_sample.sample, 
    cholesterol: cholesterol_sample.sample, 
    protein:     protein_sample.sample, 
    potassium:   potassium_sample.sample, 
    sugar:       sugar_sample.sample, 
    notes:       'Sample Data',
    user_id:     ironman.id,
    created_at:  meal_date
)

  food_item2 = FoodItem.new(
    description: food_sample.sample,
    sodium:      sodium_sample.sample,
    calories:    calorie_sample.sample, 
    cholesterol: cholesterol_sample.sample, 
    protein:     protein_sample.sample, 
    potassium:   potassium_sample.sample, 
    sugar:       sugar_sample.sample, 
    notes:       'Sample Data',
    user_id:     ironman.id,
    created_at:  meal_date
)

  snack = nil
  if snack_boolean.sample 
    snack = FoodItem.new(
    description: snack_sample.sample,
    sodium:      sodium_sample.sample,
    calories:    calorie_sample.sample, 
    cholesterol: cholesterol_sample.sample, 
    protein:     protein_sample.sample, 
    potassium:   potassium_sample.sample, 
    sugar:       sugar_sample.sample,
    notes:       'Sample Data', 
    user_id:     ironman.id,
    created_at:  meal_date
)
  end

  snack_sodium      = 0
  snack_calories    = 0
  snack_cholesterol = 0
  snack_protein     = 0
  snack_potassium   = 0
  snack_sugar       = 0

  if snack 
    snack_sodium      = snack.sodium
    snack_calories    = snack.calories
    snack_cholesterol = snack.cholesterol
    snack_protein     = snack.protein
    snack_potassium   = snack.potassium
    snack_sugar       = snack.sugar
  end

  if meal_count == 3
    meal_name = 'Dinner'
  elsif meal_count == 2
    meal_name = 'Lunch'
  elsif meal_count == 1 
    meal_name = 'Breakfast'
  end

  meal = Meal.new(
    name:              meal_name,
    sodium_total:      food_item1.sodium + food_item2.sodium + snack_sodium,
    calories_total:    food_item1.calories + food_item2.calories + snack_calories,
    cholesterol_total: food_item1.cholesterol + food_item2.cholesterol + snack_cholesterol,
    protein_total:     food_item1.protein + food_item2.protein + snack_protein,
    potassium_total:   food_item1.potassium + food_item2.potassium + snack_potassium,
    sugar_total:       food_item1.sugar + food_item2.sugar + snack_sugar,
    user_id:           ironman.id,
    created_at:        meal_date
    )
  meal.save

  food_item1[:meal_id] = meal.id
  food_item2[:meal_id] = meal.id

  if snack
    snack[:meal_id] = meal.id
    snack.save
  end

  food_item1.save
  food_item2.save

  if meal_count == 3
    meal_count = 0
    meal_date = meal_date + 1
  end
end

blood_pressure_date = Date.new(2017, 4, 25)

systolic_number = [120, 130, 140, 150, 160, 170, 180, 190]
diastolic_number = [80, 90, 100, 110, 120]
bpm = [60, 70, 80, 90, 100]
weight = [160, 163, 165]
measurement_arm = ['left']

28.times do |number|
  BloodPressure.create(
    systolic_number: systolic_number.sample,
    diastolic_number: diastolic_number.sample,
    bpm: bpm.sample,
    measurement_arm: 'left',
    weight: weight.sample,
    user_id: ironman.id,
    created_at: blood_pressure_date
)
  blood_pressure_date = blood_pressure_date + 1
end

# breakfast = Meal.create(
#     name: 'Breakfast',
#     sodium_total: 34,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 15,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 15)
# )

# lunch = Meal.create(
#     name: 'Lunch',
#     sodium_total: 34,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 15,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 15)
# )

# dinner = Meal.create(
#     name: 'Dinner',
#     sodium_total: 34,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 15,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 15)
# )



# breakfast2 = Meal.create(
#     name: 'Breakfast',
#     sodium_total: 34,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 15,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 16)
# )

# lunch2 = Meal.create(
#     name: 'Lunch',
#     sodium_total: 34,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 15,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 16)
# )

# dinner2 = Meal.create(
#     name: 'Dinner',
#     sodium_total: 34,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 43,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 16)
# )



# breakfast3 = Meal.create(
#     name: 'Breakfast',
#     sodium_total: 432,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 32,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 18)
# )

# lunch3 = Meal.create(
#     name: 'Lunch',
#     sodium_total: 23,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 15,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 18)
# )

# dinner3 = Meal.create(
#     name: 'Dinner',
#     sodium_total: 54,
#     calories_total: 260,
#     cholesterol_total: 400,
#     protein_total: 46,
#     potassium_total: 28,
#     sugar_total: 15,
#     user_id: john.id,
#     created_at: Date.new(2017, 5, 18)
# )


# blood1 = BloodPressure.create(
#     systolic_number: '118',
#     diastolic_number: '83',
#     bpm: '88',
#     measurement_arm: 'left',
#     weight: '163',
#     notes: 'Took blood pressure after showering',
#     user_id: john.id,
#     created_at: 
# )

# blood2 = BloodPressure.create(
#     systolic_number: '123',
#     diastolic_number: '88',
#     bpm: '86',
#     measurement_arm: 'right',
#     weight: '205',
#     notes: 'Received two different readings',
#     user_id: john.id
# )

# bp_meal1 = BPMeal.create(
#     meal_id: 'breakfast.id',
#     blood_pressure_id: 'blood1.id',
#     user_id: 'john.id'
# )


