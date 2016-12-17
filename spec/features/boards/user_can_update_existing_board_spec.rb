require 'rails_helper'

describe "User can update existing board" do
  scenario "User can update a board" do
    user = create(:user)
    board = Board.create(name: "Dogs", user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_board_path(user.slug, board.slug)
    expect(page).to have_content("Dogs")

    click_on "Edit Board"
    fill_in "board[name]", with: "Cats"
    click_on "Update Board"

    expect(page).to have_content("You have successfully updated this board.")
    expect(page).to have_content("Cats")
    expect(page).to_not have_content("Dogs")
  end
end
