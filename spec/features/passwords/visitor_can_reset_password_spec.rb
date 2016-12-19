require "rails_helper"

describe "visitor can reset password" do
  scenario "visitor can reset password with 2 factor auth", :vcr do
    user = create(:user, phone: "1 (707)408-3334")
    visit password_reset_path
    fill_in "user[email]", with: user.email
    click_on "Send Token"
    user.reload

    fill_in "user[verification_code]", with: user.verification_code
    fill_in "user[password]", with: "newpassword"
    fill_in "user[password_confirmation]", with: "newpassword"
    click_on "Update password"

    expect(page).to have_content("Password successfully reset")
    expect(current_path).to eq(login_path)
  end
end
