require 'rails_helper'

RSpec.describe Food, type: :model do
  @user1 = User.create(name: 'Femi')
  subject do
    Recipe.new(name: 'Recipe1', description: 'This is a test recipe', preparationTime: 5.0,
               cookingTime: 5.0, public: true, user_id: @user1)
  end

  before { subject.save }

  it 'name should be a minimum of 3 chars' do
    subject.name = 'rc'
    expect(subject).to_not be_valid
  end

  it 'Description should be minimum of 5 chars' do
    subject.name = '123'
    expect(subject).to_not be_valid
  end

  it 'Cooking and preparation Time should be decimal' do
    expect(subject.cookingTime).to be_kind_of Numeric
    expect(subject.preparationTime).to be_kind_of Numeric
  end

  it 'Public should be a boolean' do
    expect(subject.public).to be true
  end

  it 'Test instance of recipe' do
    expect(subject).to be_instance_of Recipe
  end

  it 'Recipe should belong to user' do
    expect(subject.user_id).to eql(@user1)
  end
end
