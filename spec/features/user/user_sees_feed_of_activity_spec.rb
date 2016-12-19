require 'rails_helper'

describe 'As a logged in user' do
  scenario "I can see a chonological feed of the people I follows activity" do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    user4 = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    user1.follow(user2)
    user3.follow(user2)

    board1 = create(:board, user_id: user2.id)
    pin1 = create(:pin)
    PinBoard.create(board_id: board1.id, pin_id: pin1.id)

    board2 = create(:board, user_id: user4.id)
    pin2 = create(:pin)
    PinBoard.create(board_id: board2.id, pin_id: pin2.id)

    user2.follow(user3)
    create(:comment, user_id: user2.id, pin_id: pin1.id)

    visit show_user_path(user1.username)

    expect(page).to have_content("Activity Feed")
    expect(page).to have_content("#{user3.username} followed #{user2.username}")
    expect(page).to have_content("#{pin1.last.user.username} added #{pin1.name} to #{board1.name}")
    expect(page).to have_content("#{user2.username} followed #{user3.username}")
    expect(page).to have_content("#{user2.username} commented on #{pin1.id}")
    expect(page).to_not have_content("#{user4.username} commented on #{pin1.id}")
  end
end
