class InventoriesController < ApplicationController
  def index
    @inventories = current_user.inventories
  end

  def new
    @user = current_user
    @inventory = Inventory.new
  end

  def show
    @inventory = Inventory.find(params[:id])
    @foods = InventoryFood.all
  end

  def create
    @inventory = current_user.inventories.new(inventory_params)
    if @inventory.save
      flash[:success] = 'Inventory created succesfully'
      redirect_to inventories_url
    else
      render 'new'
    end
  end

  def destroy
    @inventory = Inventory.find_by(id: params[:id])
    @inventory.destroy
    flash[:success] = 'Inventory deleted successfully'
    redirect_to inventories_url
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :quantity)
  end
end
