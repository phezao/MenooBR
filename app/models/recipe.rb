class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  accepts_nested_attributes_for :ingredients
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  def self.sample
    all.sample
  end

  def self.next_sample(recipe)
    all.excluding(recipe).sample
  end
end
