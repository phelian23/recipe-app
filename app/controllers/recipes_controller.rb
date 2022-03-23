class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe created succesfully'
      redirect_to recipe_url(@recipe)
    else
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    flash[:success] = 'Recipe deleted successfully'
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparationTime, :cookingTime, :description, :public)
  end
end
