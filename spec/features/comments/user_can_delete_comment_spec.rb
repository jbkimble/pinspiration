require "rails_helper"

describe "User can delete comment" do
  scenario "a registered user can delete their own comment" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    pin = create(:pin)
    comment = create(:comment, content: "blah blah blah", user_id: user.id, pin_id: pin.id)

    visit pin_path(comment.pin)
    click_link "delete-comment"

    expect(page).to have_content("Your comment has been deleted.")
    expect(page).to_not have_content(comment.content)
  end
end
