require "rails_helper"

describe "User can delete comment" do
  scenario "a registered user can delete their own comment" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    comment = create(:comment, user_id: user.id)

    visit comments_path
    click_on "Delete Comment"

    expect(page).to have_content("Your comment has been deleted.")
    expect(page).to_not have_content(comment.content)
  end
end
