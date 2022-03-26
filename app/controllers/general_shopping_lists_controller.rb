class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_food = RecipeFood.all
    @inventory_food = InventoryFood.all
    @missing_food = @recipe_food.food
  end
end
