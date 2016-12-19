require 'rails_helper'

describe "User sees pins belonging to board" do
  scenario "a user clicks on a board and sees all the pins on that board" do

    board = create(:board_with_pins)

    visit user_board_path(board.user.slug, board.slug)

    expect(page).to have_content("#{board.name}")
    expect(page).to have_content("#{board.pins.first.source}")
    expect(page).to have_content("#{board.pins.second.source}")
    expect(page).to have_content("#{board.pins.third.source}")
    expect(page).to have_content("#{board.pins.first.image}")
    expect(page).to have_content("#{board.pins.second.image}")
    expect(page).to have_content("#{board.pins.third.image}")
  end
end
