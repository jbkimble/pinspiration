require "rails_helper"

describe "User can view a pin" do
  scenario "user can view a pin and click save and be directed to choose a board" do
    create(:board)
    pin = Pin.create(name: "pin", image: "https://www.rover.com/blog/wp-content/uploads/2016/01/dangerous-foods-grapes.png", source: "http://www.rover.com")
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("#{pin.name}")

    click_on "#{pin.name}"

    expect(current_path).to eq(pin_path(pin))

    click_on "Save Pin"

    expect(current_path).to eq(new_pin_board_path)
    expect(page).to have_content("Choose board")
    expect(page).to have_content("pin")
    expect(page).to have_content("http://www.rover.com")
    expect(page).to have_content(pin.image)

    # select board from dropdown

    click_on "Create Pin"

    expect(page).to have_content(pin.name)
  end
end
