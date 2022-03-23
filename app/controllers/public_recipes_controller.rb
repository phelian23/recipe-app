class PublicRecipesController < ApplicationController
  def index
  
    @public_recipes = Recipe.where(public: true)
  end
  def total_items
    @total_item = Food.count
  end
end
