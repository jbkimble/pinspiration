require "rails_helper"

describe "Visitor can view a pin" do
  scenario "visitor can view a pin and click save and be directed to log in" do
    create(:board)
    pin = Pin.create(name: "pin", image: "https://www.rover.com/blog/wp-content/uploads/2016/01/dangerous-foods-grapes.png", source: "http://www.rover.com")

    visit root_path

    expect(page).to have_xpath("//img[contains(@src,'#{pin.image}')]")

    click_link "#{pin.name}"

    expect(current_path).to eq(pin_path(pin))

    click_link "Pin me!"

    expect(current_path).to eq(login_path)
  end
end
