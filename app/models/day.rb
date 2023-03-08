class Day < ApplicationRecord
  has_many :day_recipes, dependent: :destroy
  has_many :recipes, through: :day_recipes
  belongs_to :menu
  validates :weekday, presence: true
  enum weekday: { monday: 0, tuesday: 1, wednesday: 2, thursday: 3, friday: 4 }

  accepts_nested_attributes_for :day_recipes, allow_destroy: true
end
