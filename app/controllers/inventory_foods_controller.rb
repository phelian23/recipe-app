class InventoryFoodsController < ApplicationController
  def new
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.new
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.create(inventory_food_params)
    if @inventory_food.save
      flash[:success] = 'Food created succesfully'
      redirect_to inventories_url
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
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
