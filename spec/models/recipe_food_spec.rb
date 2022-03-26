require 'rails_helper'

RSpec.describe Food, type: :model do
    @user1 = User.create(name: 'Femi')
    @food1 = Food.create(name: 'Food1', measurementUnit: 'Kg', price: 5, user_id: @user1)
    @recipe1 = Recipe.new(name: 'Secret Recipe', description: 'This is a recipe', preparationTime: 15.0, cookingTime: 1.0, public: true, user_id: @user1)
    subject do RecipeFood.new(quantity: 5, food_id: @food1 , recipe_id: @recipe1 ) 
    end

  before { subject.save }

  it "quantity should be present" do
    subject.quantity = nil
    expect(subject).to_not be_valid 
  end

  it "quantity should be numeric value" do
    expect(subject.quantity).to be_kind_of Numeric 
  end

  it "Recipe should belong to food and recipe" do
    expect(subject.food_id).to eql (@food1)
    expect(subject.recipe_id).to eql (@recipe1)
  end
end