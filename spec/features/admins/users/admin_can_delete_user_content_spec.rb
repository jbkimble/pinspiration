require "rails_helper"

describe "Admin deletes user content" do
  scenario "admin can delete user boards" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    user = create(:user)
    board = create(:board, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_user_path(user)

    expect(page).to have_content(board.name)

    click_link  "Delete"

    expect(page).to have_content("Board has been deleted")
    expect(page).to_not have_content(board.name)
  end
  scenario "admin can delete user comments" do
    role = Role.create(name: "admin")
    admin = create(:user, roles:[role])
    user = create(:user)
    comment = create(:comment, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_user_path(user)

    expect(page).to have_content(comment.content)

    click_link  "Delete"

    expect(page).to have_content("Comment has been deleted")
    expect(page).to_not have_content(comment.content)

  end
end
