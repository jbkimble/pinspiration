require "rails_helper"

describe "User can edit comment" do
  scenario "a registered user can edit their own comment" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    comment = create(:comment, user_id: user.id)

    new_comment = "my new comment"

    visit comments_path
    click_on "Edit Comment"

    fill_in "comment[content]", with: new_comment
    click_on "Submit"

    expect(page).to have_content ("my new comment")
    expect(page).to have_content ("Your comment has been updated.")
    end
 end
