require "rails_helper"

describe "visitor can reset password using 2 factor auth" do
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
  scenario "visitor sees error message with invalid verification_code", :vcr do
    user = create(:user, phone: "1 (707)408-3334")
    visit password_reset_path
    fill_in "user[email]", with: user.email
    click_on "Send Token"
    user.reload

    fill_in "user[verification_code]", with: 123456
    fill_in "user[password]", with: "newpassword"
    fill_in "user[password_confirmation]", with: "newpassword"
    click_on "Update password"

    expect(page).to have_content("Verification code not found")
    expect(current_path).to eq(password_reset_path)
  end
  scenario "visitor sees error message with invalid email", :vcr do
    user = create(:user, phone: "1 (707)408-3334")
    visit password_reset_path
    fill_in "user[email]", with: "email@notvalid.com"
    click_on "Send Token"

    expect(page).to have_content("Invalid email. Please try again.")
    expect(current_path).to eq(password_reset_path)
  end
end
