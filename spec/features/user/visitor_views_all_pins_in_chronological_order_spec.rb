require 'rails_helper'

describe "As a visitor" do
  context "I visit the root path" do
    scenario "and I see all the pins" do
      pins = create_list(:pin, 10)
      second_newest_pin = create(:pin)
      newest_pin = create(:pin)

      visit root_path

      expect(page).to have_selector(".pin", count:12)

      within(".pin:first") do
        expect(page).to have_xpath("//img[contains(@src,#{newest_pin.image})]")
      end
    end
  end
end
