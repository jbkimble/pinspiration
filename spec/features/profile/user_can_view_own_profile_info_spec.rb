require 'rails_helper'

describe "User can see profile" do
  scenario "a logged-in user can see their own profile" do
    user = create(:user)
    user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit profile_path

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
    expect(page).to_not have_content(user2.email)
    expect(page).to have_content(user.phone)
    expect(page).to have_content(user.username)
    expect(page).to_not have_content(user2.username)
    expect(page).to have_content("Account Information")
    expect(page).to have_link("Edit Account Info", href: edit_user_path(user))
  end

  scenario "a visitor tries to view profile page" do
    visit profile_path

    expect(page).to_not have_content("Account Information")
    expect(page).to have_content("You are not authorized to view that page.")
    expect(page).to have_content("Login")
  end
end
