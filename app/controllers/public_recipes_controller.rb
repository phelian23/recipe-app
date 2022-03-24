class PublicRecipesController < ApplicationController
  def index
    @user = current_user
    @total_item = current_user.recipes.all.count
    # @total_val = @user.recipe_foods.all(:quantity)
    # @total_item = current_user.foods.all.count
    @prices = current_user.foods.all.sum(:price)
    @public_recipes = Recipe.where(public: true)
  end
end
