require "rails_helper"

describe "Admin deletes user content" do
  scenario "admin can delete user content" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

  end
end
