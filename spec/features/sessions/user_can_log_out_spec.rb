require "rails_helper"

describe "Logged in user can log out" do

  scenario "A logged in user clicks the logout button" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on "Logout"

    expect(current_path).to eq root_path
    expect(page).to_not have_content "#{user.name}"
    expect(page).to have_link("Login", href: login_path)
  end
end
