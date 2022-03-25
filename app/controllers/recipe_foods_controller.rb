class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    if @recipe_food.save
      flash[:success] = 'Food created succesfully'
      redirect_to recipe_foods_url
    else
      render 'new'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'Food deleted successfully'
    redirect_to recipe_food_path
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
