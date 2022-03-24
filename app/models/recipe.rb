class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods

  validates :name, presence: true
  validates :description, presence: true
end
