require "rails_helper"

describe "Visitor can view a pin" do
  scenario "visitor can view a pin and click save and be directed to log in" do
    board = create(:board)
    pin = Pin.create(name: "pin", image: "https://www.rover.com/blog/wp-content/uploads/2016/01/dangerous-foods-grapes.png", source: "http://www.rover.com")

    visit root_path

    expect(page).to have_content("#{pin.name}")

    click_on "#{pin.name}"

    expect(current_path).to eq(pin_path(pin))

    click_on "Save Pin"

    expect(current_path).to eq(login_path)
  end
end
