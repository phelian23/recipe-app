class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods
  has_many :foods_url

  validates :name, presence: true
end
