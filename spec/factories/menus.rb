FactoryBot.define do
  factory :menu do
    after :create do |menu|
      5.times { |n| create(:day, menu: menu, weekday: n) }
    end
  end
end
