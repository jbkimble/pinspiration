require 'rails_helper'

describe 'As a User' do
  context "I visit the home page and click on 'create account'" do
    scenario 'And I am able to enter my information and create and account' do
      create(:role, id: 2, name: "user")
      visit root_path
      click_on 'Create Account'

      fill_in 'Username', with: 'bilbo'
      fill_in 'Email', with: 'b@shire.com'
      fill_in 'Name', with: 'Bilbo Baggins'
      fill_in 'Phone', with: '555-123-4567'
      fill_in 'Password', with: '123'
      fill_in 'Password Confirmation', with: '123'

      click_on 'Create Account'

      expect(page).to have_content('Welcome Bilbo Baggins')
      expect(page).to have_content('Logout')
      expect(current_path).to eq(root_path)
      expect(User.all.count).to eq(1)
    end

    scenario "And I leave out required information" do
      create(:role, id: 2, name: "user")
      visit root_path
      click_on 'Create Account'

      fill_in 'Email', with: 'b@shire.com'
      fill_in 'Name', with: 'Bilbo Baggins'
      fill_in 'Phone', with: '555-123-4567'
      fill_in 'Password', with: '123'
      fill_in 'Password Confirmation', with: '123'

      click_on 'Create Account'

      expect(page).to have_content('Account creation failed')
      expect(page).to have_content('Login')
      expect(current_path).to eq(root_path)
      expect(User.all.count).to eq(0)
    end
  end
end
