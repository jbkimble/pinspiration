require "rails_helper"

describe "User can leave comment" do
  scenario "a registered user can leave a comment" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    pin = create(:pin)

    comment = "my comment"

    visit pin_path(pin)

    expect(page).to have_content("Leave a comment")

    fill_in "comment[content]", with: comment

    click_on "Create Comment"

    expect(page).to have_content("my comment")
    expect(page).to have_content("Your comment has been saved.")
  end
end
