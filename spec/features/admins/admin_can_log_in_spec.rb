require "rails_helper"

describe "an admin can log in" do
  scenario "an admin visits login page and logs in" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    visit login_path

    fill_in "email", with: "#{admin.email}"
    fill_in "password", with: "#{admin.password}"

    click_button "Login"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Successfully logged in as #{admin.name}")
    expect(page).to have_selector("#logout")
    expect(page).to_not have_selector("#login")
  end

  describe "an admin cannot log in" do
    scenario "an admin enters an incorrect password" do
      role = Role.create(name: "admin")
      admin = create(:user, roles:[role])
      visit login_path

      fill_in "email", with: "#{admin.email}"
      fill_in "password", with: "dogs"

      click_button "Login"

      expect(page).to have_content("Login failed, please try again.")

      expect(page).to have_selector("#login")
      expect(page).to_not have_selector("#logout")
    end

    scenario "an admin cannot log in with incomplete information" do
      role = Role.create(name: "admin")
      admin = create(:user, roles:[role])
      visit login_path

      fill_in "email", with: ""
      fill_in "password", with: "#{admin.password}"

      click_button "Login"

      expect(page).to have_content("Login failed, please try again.")
      expect(page).to have_selector("#login")
      expect(page).to_not have_selector("#logout")
    end
  end
end
