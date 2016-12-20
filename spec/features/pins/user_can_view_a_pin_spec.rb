require "rails_helper"

describe "User can view a pin" do
  scenario "user can view a pin and click save and be directed to choose a board" do
    board = create(:board)
    pin = Pin.create(name: "pin", image: "https://www.rover.com/blog/wp-content/uploads/2016/01/dangerous-foods-grapes.png", source: "http://www.rover.com")
    user = create(:user)
    board.user = user
    board.save
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_xpath("//img[contains(@src,'#{pin.image}')]")

    click_link "#{pin.name}"


    expect(current_path).to eq(pin_path(pin))

    click_link "Pin me!"

    expect(current_path).to eq(new_pin_board_path)
    expect(page).to have_content("Choose board")

    click_on "Add to board"

    expect(page).to have_content(pin.name)
    expect(page).to have_content("#{pin.name} has been added to your board")
    expect(current_path).to eq("/boards/mytext")
  end
  xscenario "user can view a pin and click save and be allowed to create a board" do
    board = create(:board)
    pin = Pin.create(name: "pin", image: "https://www.rover.com/blog/wp-content/uploads/2016/01/dangerous-foods-grapes.png", source: "http://www.rover.com")
    user = create(:user)
    board.user = user
    board.save
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("#{pin.name}")

    click_on "#{pin.name}"

    expect(current_path).to eq(pin_path(pin))

    click_on "Save Pin"

    expect(current_path).to eq(new_pin_board_path)
    expect(page).to have_content("New board name")

    fill_in "pin_board[name]"

    click_on "Create board and add pin"

    expect(page).to have_content(pin.name)
    expect(page).to have_content("#{pin.name} has been added to your board")
    expect(current_path).to eq("/boards/mytext")
  end
end
