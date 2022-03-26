require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  describe 'index page' do
    before(:each) do
      visit user_session_path
      @danny = User.create!(name: 'Dan',
                            email: 'dan@gmail.com',
                            password: '1234567',
                            password_confirmation: '1234567')
  
      within('#new_user') do
        fill_in 'Email', with: 'dan@gmail.com'
        fill_in 'Password', with: '1234567'
      end
      click_button 'Log in'
      visit recipes_path
    end

    it 'expect page path to be the recipes path' do
      expect(page).to have_current_path recipes_path
    end

    it 'Recipes page shows the right content' do
      expect(page).to have_content('Recipe')
    end    
  end
end