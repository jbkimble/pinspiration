require "rails_helper"

describe "Admin disables user" do
  scenario "admin clicks disable button to disable user" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_user_path(user)

    expect(page).to have_content("User Status: active")

    click_on "Disable"

    expect(page).to have_content("User has been disabled")
    expect(page).to_not have_content("Active")
  end
end
