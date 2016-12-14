require "rails_helper"

describe "User can leave comment" do
  scenario "a registered user can leave a comment" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    comment = "my comment"

    visit comments_path

    click_on "New Comment"

    fill_in "Comment", with: comment

    click_on "Submit Comment"

    expect(page).to have_content("my comment")
  end
end
