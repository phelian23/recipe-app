class InventoryFoodsController < ApplicationController
  def index
    @inventory_foods = InventoryFood.all
  end

  def new
    @inventory_food = InventoryFood.new
  end

  def create
    @inventory_food = InventoryFood.new(inventory_food_params)
    if @inventory_food.save
      flash[:success] = 'Food created succesfully'
      redirect_to inventory_foods_url
    else
      render 'new'
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    flash[:success] = 'Food deleted successfully'
    redirect_to inventory_food_path
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity)
  end
end
