john = User.create(
    first_name: 'John',
    last_name: 'Abbington', 
    email: 'jabby@email.com',
    password: 'password', 
    smoker: 'true'
)

# User.create(
#     first_name: 'Francis',
#     last_name: 'Whittaker', 
#     email: 'fwitt@email.com',
#     password_digest: 'password', 
#     smoker: 'false'
# )

breakfast = Meal.create(
    name: 'Breakfast',
    sodium_total: '34',
    calories_total: '260',
    cholesterol_total: '400',
    protein_total: '46',
    potassium_total: '28',
    sugar_total: '15',
    user_id: john.id
)

breakfast2 = Meal.create(
    name: 'Breakfast',
    sodium_total: '34',
    calories_total: '260',
    cholesterol_total: '400',
    protein_total: '46',
    potassium_total: '28',
    sugar_total: '15',
    user_id: john.id
)


bacon = FoodItem.create(
    description: 'bacon',
    sodium: '34',
    calories: '260',
    cholesterol: '400',
    protein: '46',
    potassium: '28',
    sugar: '15',
    notes: 'I ate 1/2 slice of bacon',
    meal_id: breakfast2.id
)

eggs = FoodItem.create(
    description: 'eggs',
    sodium: '54',
    calories: '150',
    cholesterol: '35',
    protein: '30',
    potassium: '15',
    sugar: '30',
    notes: 'Added cheese to eggs',
    meal_id: breakfast2.id
)

toast = FoodItem.create(
    description: 'toast',
    sodium: '12',
    calories: '80',
    cholesterol: '100',
    protein: '2',
    potassium: '6',
    sugar: '40',
    notes: 'Added blueberry jam',
    meal_id: breakfast2.id
)

cereal = FoodItem.create(
    description: 'cereal',
    sodium: '180',
    calories: '120',
    cholesterol: '40',
    protein: '54',
    potassium: '8',
    sugar: '25',
    notes: 'With Skim Milk',
    meal_id: breakfast.id
)

blood1 = BloodPressure.create(
    systolic_number: '118',
    diastolic_number: '83',
    bpm: '88',
    measurement_arm: 'left',
    weight: '163',
    notes: 'Took blood pressure after showering',
    user_id: john.id

)

blood2 = BloodPressure.create(
    systolic_number: '123',
    diastolic_number: '88',
    bpm: '86',
    measurement_arm: 'right',
    weight: '205',
    notes: 'Received two different readings',
    user_id: john.id
)

bp_meal1 = BPMeal.create(
    meal_id: 'breakfast.id',
    blood_pressure_id: 'blood1.id',
    user_id: 'john.id'
)


