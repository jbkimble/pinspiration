require 'rails_helper'

describe 'As a logged in user' do
  before :each do
    role = create(:role, id: 2, name: "user")
    visit new_user_path

    fill_in 'Username', with: 'Bilbo'
    fill_in 'Email', with: 'b@shire.com'
    fill_in 'Name', with: 'Bilbo Baggins'
    fill_in 'Phone', with: '555-123-4567'
    fill_in 'Password', with: '123'
    fill_in 'Password Confirmation', with: '123'

    click_on 'Create Account'
  end

  context 'I can edit my account information' do
    scenario 'my account information changes' do
      user = User.first

      visit edit_user_path(user)

      fill_in "Avatar", with: "bilbo.jpg"

      click_on "Update Profile"

      expect(current_path).to eq(profile_path)
      expect(page).to have_xpath("//img[contains(@src,'bilbo.jpg')]")
    end

    scenario 'But I cancel my changes' do
      user = User.first

      visit edit_user_path(user)

      fill_in "Avatar", with: "bilbo.jpg"

      click_on "Cancel"

      expect(current_path).to eq(profile_path)
      expect(page).to_not have_xpath("//img[contains(@src,'bilbo.jpg')]")
    end
  end
end
