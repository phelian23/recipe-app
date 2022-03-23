class Recipe < ApplicationRecord
  belongs_user :user
  has_many :recipe_foods
  has_many :foods_url

  validates :name, presence: true
  validates :description, presence: true
end
