FactoryBot.define do
  factory :day do
    menu
    weekday { (0..4).to_a.sample }
    after :create do |day|
      2.times { |n| create(:day_recipe, meal_type: n, day: day) }
    end
  end
end
