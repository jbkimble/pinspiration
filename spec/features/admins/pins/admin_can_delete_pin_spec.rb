require 'rails_helper'

describe "Admin can delete pin from the database" do
  scenario "an admin can delete a pin from the database" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    pin1, pin2, pin3 = create_list(:pin, 3)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_pin_path(pin1)

    click_link('Permanently Delete')

    expect(current_path).to eq(admin_pins_path)
    expect(page).to have_content("Pin has been deleted")
    expect(page).to have_content("#{pin2.name}")
    expect(page).to have_content("#{pin3.name}")
    expect(page).to_not have_content("#{pin1.name}")
  end
end
