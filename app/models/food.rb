class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods, dependent: :destroy
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods, dependent: :destroy

  validates :name, presence: true
  validates :measurementUnit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
