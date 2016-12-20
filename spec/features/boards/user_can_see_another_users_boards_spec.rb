require "rails_helper"

describe "User can view another user's boards" do
  xscenario "User see's all the public boards on another users show page" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    showing_user = create(:user, username:"showing_user")

    user.boards.create(name:"visiting users board")

    showing_user.boards.create(name:"showing user board one public")
    showing_user.boards.create(name:"showing user board two public")
    showing_user.boards.create(name:"showing user board three private", isprivate:true)

    visit show_user_path(showing_user.slug)

    expect(current_path).to eq("/#{showing_user.slug}")
    expect(page).to have_content("showing user board one public")
    expect(page).to have_content("showing user board two public")

    expect(page).to_not have_content("showing user board three private")
    expect(page).to_not have_content("visiting users board")

  end
end
