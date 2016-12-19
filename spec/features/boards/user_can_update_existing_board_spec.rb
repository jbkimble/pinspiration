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

  scenario "User sees error if updating a board without a name" do
    user = create(:user)
    board = Board.create(name: "Dogs", user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_board_path(user.slug, board.slug)
    expect(page).to have_content("Dogs")

    click_on "Edit Board"
    fill_in "board[name]", with: ""
    click_on "Update Board"

    expect(page).to have_content("Board update failed, please try again")
  end

  xscenario "User can change a public board to private" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    board = create(:board, name: 'Movies', user: user)

    visit edit_board_path(board)
    select "Private", :from => "board_isprivate"
    click_on "Update Board"
    visit show_user_path(user.username)

    within('div.private') do
      expect(page).to have_content('Movies')
    end
  end

  xscenario "User can change a private board to private" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    board = create(:board, name: 'Dogs', user: user, isprivate: true)

    visit edit_board_path(board)
    select "Public", :from => "board_isprivate"
    click_on "Update Board"
    visit show_user_path(user.username)

    within('div.private') do
      expect(page).to have_content('Dogs')
    end
  end
end
