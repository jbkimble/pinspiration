require 'rails_helper'

describe "User  can invite another user to see thier private board" do
  scenario "user invites the another user to see thier private board" do
    user = create(:user)
    invitee = create(:user, username:"test")
    board = user.boards.create(name: "private board", isprivate: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.boards.create(name:"private-board", isprivate:true)

    visit show_user_path(user.slug)

    click_on "#{board.name}"

    click_on
  end
end
