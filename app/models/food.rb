class Food < ApplicationRecord
    belongs_to :user
    has_many :recipe_foods
    has_many :inventory_foods
    has_many :foods
    has_many :inventories

    validates :name, presence: true
    validates :measurementUnit, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end