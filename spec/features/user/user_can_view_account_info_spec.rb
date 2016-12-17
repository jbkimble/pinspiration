require 'rails_helper'

describe 'As a logged in user' do
  before :each do
    role = create(:role, id: 2, name: "user")
    visit new_user_path

    #fill_in 'Avatar', with: 'https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg'
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
  end
end
