class GeneralShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
    @missing_food = @recipe.food
  end
end
