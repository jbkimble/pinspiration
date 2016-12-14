require "rails_helper"

describe "User can leave comment" do
  scenario "a registered user can leave a comment" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    comment = "my comment"

    visit comments_path

    click_on "New Comment"

    fill_in "comment[content]", with: comment

    click_on "Create Comment"

    expect(page).to have_content("my comment")
    expect(page).to have_content("Your comment has been saved.")
  end
end
