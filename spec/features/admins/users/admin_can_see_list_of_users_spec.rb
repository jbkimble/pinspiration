require "rails_helper"

describe "admin sees list of users" do
  scenario "an admin can see a list of users and view their profiles" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    user1, user2, user3 = create_list(:user, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    expect(page).to have_content(user3.name)
  end
end
