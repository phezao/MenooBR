FactoryBot.define do
  factory :day_recipe do
    day
    recipe
    meal_type { [0, 1].sample }
  end
end
