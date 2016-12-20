require "rails_helper"

describe "Logged in user can log out" do
  scenario "A logged in user clicks the logout button" do
    user = create(:user)
    visit login_path

    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"
    click_button "Login"

    visit root_path

    find("#logout").click

    expect(current_path).to eq root_path
    expect(page).to_not have_content "#{user.name}"
    # expect(page).to have_selector("#login")
  end
end
