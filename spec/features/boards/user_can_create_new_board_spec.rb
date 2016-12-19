require 'rails_helper'

describe "User can create board" do
  scenario "User can create a new board" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit show_user_path(user.username)
    board_name = "Dogs and Puppies"

    click_on "Create Board"
    fill_in "board[name]", with: board_name
    click_on "Create Board"

    expect(page).to have_content("You have successfully create the board #{board_name}.")
  end
  scenario "User sees error if creating new board without name" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit show_user_path(user.username)
    board_name = "Dogs and Puppies"

    click_on "Create Board"
    click_on "Create Board"

    expect(page).to have_content("Board creation failed, please try again")
  end

  scenario "User can create a public board" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit show_user_path(user.username)
    click_on "Create Board"
    fill_in "board[name]", with: "Wolverines"
    click_on "Create Board"
    visit show_user_path(user.username)

    within('.public-board') do
      expect(page).to have_content('Wolverines')
    end
  end

  # scenario "User can create a private board" do
  #   user = create(:user)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #   visit show_user_path(user.username)
  #   click_on "Create Board"
  #   fill_in "board[name]", with: "Apple Blossoms"
  #   select "Private", :from => "board_isprivate"
  #   click_on "Create Board"
  #   visit show_user_path(user.username)
  #
  #   within('div.private') do
  #     expect(page).to have_content('Apple Blossoms')
  #   end
  # end

end
