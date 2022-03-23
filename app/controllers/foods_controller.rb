class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    @food = current_user.foods.create(food_params)
    if @food.save
      flash[:success] = 'Food created succesfully'
      redirect_to foods_url
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = 'Food deleted successfully'
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurementUnit, :price, :user_id)
  end
end
