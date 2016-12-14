require 'rails_helper'

describe 'As a logged in user' do
  before :each do
    role = create(:role, id: 2, name: "user")
    visit new_user_path

    fill_in 'Avatar', with: 'https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg'
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
      expect(page).to have_content('Bilbo')
      expect(page).to have_content('Bilbo Baggins')
      expect(page).to have_content('b@shire.com')
      expect(page).to have_content('555-123-4567')
      expect(page).to have_content('*******')
    end
  end

  context 'I can edit my account information' do
    scenario 'the edits show up on my profile page' do
      visit profile_path
      click_on "Edit Account Info"

      expect(current_path).to eq(users_edit_path)
      fill_in "Name", with: "Smaug"
      fill_in "Username", with: "Firebreather46"

      click_on "Update Profile"

      expect(current_path).to eq(profile_path)
      expect(page).to have_content("Smaug")
      expect(page).to have_content("Firebreather46")

      expect(page).to_not have_content("Bilbo")
      expect(page).to_not have_content("Bilbo Baggins")
    end
  end
end
