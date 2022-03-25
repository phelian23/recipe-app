class GeneratesRecipeController < ApplicationController
  before_action :authenticate_user!
    include GenerateRecipeHelper

    def index
      @recipes = current_user.recipes
      @total_price = Food.all.sum(:price)
    end

    def show
      @shopping = Recipe.find(params[:id])
    end

    def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(new_params)
      flash[:success] = 'Recipe Food updated successfully.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to generates_recipe_path(@recipe_food.recipe_id)
  end

end