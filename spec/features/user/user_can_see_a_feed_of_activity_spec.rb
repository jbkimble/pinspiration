require 'rails_helper'

describe "As a user" do
  context "I my show page" do
    xscenario "and I see a feed of activity for users I'm following" do
      user1 = create(:user, name: "Bob", username: "bob111", email: "bob@email.com")
      user2 = create(:user, name: "Mary", username: "mary222", email: "mary@email.com")
      user3 = create(:user, name: "Frank", username: "f222", email: "f@email.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit show_user_path(user2.username)
      click_button "Follow"
      create(:board, name:"pandas", user_id: user2.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)
      visit show_user_path(user3.username)
      click_button "Follow"

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit show_user_path(user1.username)
      save_and_open_page
      expect(page).to have_content("Mary created a new board pandas")
    end
  end
end
