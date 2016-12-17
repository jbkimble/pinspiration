require 'rails_helper'

describe "User can create board" do
  scenario "User can create a new board" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit show_user_path(user.username)
    board_name = "Dogs and Puppies"

    click_on "Create New Board"
    fill_in "board[name]", with: board_name
    click_on "Create Board"

    expect(page).to have_content("You have successfully create the board #{board_name}.")
  end
  scenario "User sees error if creating new board without name" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit show_user_path(user.username)
    board_name = "Dogs and Puppies"

    click_on "Create New Board"
    click_on "Create Board"

    expect(page).to have_content("Board creation failed, please try again")
  end
end
