require 'rails_helper'

describe "As a User" do
  context "I visit the home page and click on 'create account'" do
    it "And I am able to enter my information and create and account" do
      visit root_path
      click_on "Create Account"

      fill_in "Username", with: "Bilbo"
      fill_in "Email", with: "b@shire.com"
      fill_in "Name", with: "Bilbo Baggins"
      fill_in "Phone", with: "555-123-4567"
      fill_in "Password", with: "123"
      fill_in "Password Confirmation", with: "123"

      click_on "Create Account"

      expect(page).to have_content("Welcome Bilbo Baggins")
      expect(page).to have_content("Bilbo")
      expect(current_path).to eq(dashboard_path)
    end
  end
end
