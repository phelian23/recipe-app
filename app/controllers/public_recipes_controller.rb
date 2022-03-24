class PublicRecipesController < ApplicationController
  def index
    @user = current_user
    # @users =User.all
    @total_item = Recipe.all.count
    # @total_val = @user.recipe_foods.all(:quantity)
    # @total_item = current_user.foods.all.count
    @prices = Food.all.sum(:price)
    @all_recipe = Recipe.all
    @public_recipes = @all_recipe.where(public: true)
    # @all = Recipe.all
  end
end
