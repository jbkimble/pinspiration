require 'rails_helper'

describe 'As a logged in user' do
  context 'I visit another users profile page' do
    scenario 'I can follow another user' do
      user1 = create(:user, name: "Bob", username: "bob111", email: "bob@email.com")
      user2 = create(:user, name: "Mary", username: "mary222", email: "mary@email.com")

      create(:board, name:"jaguar", user_id: user1.id)
      create(:board, name:"pandas", user_id: user2.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

      visit show_user_path(user1.username)
      expect(page).to have_content(0)

      visit show_user_path(user2.username)

      click_button "Follow"

      expect(page).to have_content(1)
      expect(page).to have_content("Following")
      expect(current_path).to eq(show_user_path(user2.username))

      visit show_user_path(user1.username)
      expect(page).to have_content(1)
    end
  end
end
