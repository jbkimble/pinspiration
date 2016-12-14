require 'rails_helper'

describe 'As a logged in user' do
  before :each do
    visit new_user_path

    fill_in 'Username', with: 'Bilbo'
    fill_in 'Email', with: 'b@shire.com'
    fill_in 'Name', with: 'Bilbo Baggins'
    fill_in 'Phone', with: '555-123-4567'
    fill_in 'Password', with: '123'
    fill_in 'Password Confirmation', with: '123'

    click_on 'Create Account'
  end

  context 'I can visit my account page' do
    scenario 'shows my account information' do
      visit profile_path
      save_and_open_page
      expect(page).to have_content('Bilbo')
      expect(page).to have_content('Bilbo Baggins')
      expect(page).to have_content('b@shire.com')
      expect(page).to have_content('555-123-4567')
      expect(page).to have_content('*******')
    end
  end
end
