require "rails_helper"

describe "Logged in admin can log out" do
  scenario "A logged in admin clicks the logout button" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    visit login_path

    fill_in "email", with: "#{admin.email}"
    fill_in "password", with: "#{admin.password}"
    click_button "Login"

    # find("#logout").click
    visit logout_path

    expect(current_path).to eq root_path
    expect(page).to_not have_content "#{admin.name}"
    # expect(page).to have_selector("#login")
  end
end
