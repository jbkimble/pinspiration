require "rails_helper"

describe "admin sees users" do
  scenario "an admin can see a list of users" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    user1, user2, user3 = create_list(:user, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    expect(page).to have_content(user1.username)
    expect(page).to have_content(user2.username)
    expect(page).to have_content(user3.username)
  end
  scenario "an admin can click on a user and view their content" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    user1, user2, user3 = create_list(:user, 3)
    board = create(:board_with_pins)
    board = Board.update(user_id: user1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    click_on user1.username

    single_board = board.first

    expect(current_path).to eq(admin_user_path(user1.id))

    expect(page).to have_content(single_board.name)
    expect(page).to have_content(single_board.pins.first.name)
    expect(page).to have_content(single_board.pins.second.name)
    expect(page).to have_content(single_board.pins.third.name)
  end

end
