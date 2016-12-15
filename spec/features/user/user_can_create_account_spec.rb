require 'rails_helper'

describe 'As a User' do
  context "I visit the home page and click on 'create account'" do
    scenario 'And I am able to enter my information and create and account' do
      create(:role, id: 2, name: "user")
      visit root_path
      click_on 'Create Account'

      fill_in 'Avatar', with: 'https://images-na.ssl-images-amazon.com/images/G/01/img15/pet-products/small-tiles/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg'
      fill_in 'Username', with: 'Bilbo'
      fill_in 'Email', with: 'b@shire.com'
      fill_in 'Name', with: 'Bilbo Baggins'
      fill_in 'Phone', with: '555-123-4567'
      fill_in 'Password', with: '123'
      fill_in 'Password Confirmation', with: '123'

      click_on 'Create Account'

      expect(page).to have_content('Welcome Bilbo Baggins')
      expect(page).to have_content('Bilbo')
      expect(current_path).to eq(root_path)
    end
  end
end
