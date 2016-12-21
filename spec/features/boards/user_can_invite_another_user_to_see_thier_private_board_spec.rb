require 'rails_helper'

describe "User  can invite another user to see thier private board" do
  scenario "user invites the another user to see thier private board" do
    user = create(:user)
    invitee = create(:user, username:"test")
    board = user.boards.create(name: "private board", isprivate: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user.boards.create(name:"private-board", isprivate:true)

    visit show_user_path(user.slug)

    expect(SharedBoard.all.count).to eq(0)


    click_on "#{board.name}"
    fill_in "viewer", :with => "#{invitee.username}"
    click_on "Share"

    expect(SharedBoard.all.count).to eq(1)
    expect(SharedBoard.first.owner_id).to eq(user.id)
    expect(SharedBoard.first.viewer_id).to eq(invitee.id)
    expect(SharedBoard.first.board_id).to eq(board.id)
  end
end
