require 'rails_helper'

describe "User can delete existing board" do
  scenario "User can delete a board" do
    user = create(:user)
    board = Board.create(name: "Dogs", user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_board_path(user.slug, board.slug)
    expect(page).to have_content("Dogs")

    click_on "Delete Board"

    expect(page).to have_content("You have successfully deleted this board.")
  end
end
