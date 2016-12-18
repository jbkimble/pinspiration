require 'rails_helper'

describe "As a visitor" do
  context "I visit the root path" do
    scenario "and I see all the pins" do
      pins = create_list(:pin, 10)
      second_newest_pin = create(:pin name:"second newest pin")
      newest_pin = create(:pin, name:"newest pin")

      visit root_path

      expect

    end
  end
end
