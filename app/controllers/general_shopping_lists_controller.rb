class GeneralShoppingListsController < ApplicationController
  def index
    @recipe_food = Recipe_food.find(params[:recipe_id])
    @inventory_food = Inventory_food.find(params[:inventory_id])
    @missing_food = @recipe_food.all
  end
end
