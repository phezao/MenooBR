FactoryBot.define do
  factory :recipe do
    title { Faker::Food.unique.dish }
    notes { Faker::Food.description }
    after :create do |recipe|
      create_list :ingredient, 5, recipes: [recipe]
    end
  end
end
