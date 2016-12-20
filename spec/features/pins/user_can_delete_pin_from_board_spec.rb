require 'rails_helper'

describe "User can remove pin from board" do
  scenario "a user can click delete to remove pin from board" do
  user = create(:user)
  board = create(:board_with_pins)

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

  visit user_board_path(board.user.slug, board.slug)

  expect(page).to have_content("#{board.pins.first.source}")
  expect(page).to have_content("#{board.pins.second.source}")
  expect(page).to have_content("#{board.pins.first.image}")
  expect(page).to have_content("#{board.pins.second.image}")

  first('.pin').click_on('Remove')

  expect(current_path).to eq(user_board_path(board.user.slug, board.slug))

  expect(page).to have_content("Pin has been removed")
  expect(page).to have_content("#{board.pins.second.source}")
  expect(page).to have_content("#{board.pins.second.image}")
  end
end
