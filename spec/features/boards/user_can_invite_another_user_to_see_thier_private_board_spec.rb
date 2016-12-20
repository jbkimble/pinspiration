require 'rails_helper'

describe "User  can invite another user to see thier private board" do
  scenario "user invites the another user to see thier private board" do
    user = create(:user)
    invitee = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.boards.create(name:"private-board", isprivate:true)

    visit show_user_path(user.slug)
  end
end
