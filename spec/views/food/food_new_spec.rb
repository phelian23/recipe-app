require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  describe 'Add Food page' do
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
      click_link 'New food'
    end

    it 'Add Foods page shows the right content' do
      expect(page).to have_content('New Food')
      expect(page).to have_content('Name')
      expect(page).to have_content('Measurement unit')
      expect(page).to have_content('Price')
    end

    it 'Add food page has the right fields' do
      expect(page).to have_field('food[name]')
      expect(page).to have_field('food[measurementUnit]')
      expect(page).to have_field('food[price]')
    end
  end
end
