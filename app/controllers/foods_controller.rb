class FoodsController < ApplicationController
  before_action :authenticate_user!

    def index
     @foods = Food.all
    end
    def new
     @food = Food.new
    end

    def create 
        @food = Food.new(food_params)
        # @food.user_id = @user.user_id
        if @food.save
        flash[:success] = 'Food created succesfully'
        redirect_to user_path
    
        else
        render 'new'
        end
    end

    private

    def food_params
    params.require(:food).permit(:name, :measurementUnit, :price)
    end
end