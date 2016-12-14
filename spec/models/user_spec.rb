require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        user = User.new(email: "cats@cats.com", username: "bob", password: "password", phone: "1111111111")
        expect(user).to be_invalid
      end

      it "is invalid without a email" do
        user = User.new(name: "Bob", username: "bob", password: "password", phone: "2222222222")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(name: "Bob", username: "bob", email: "cats@cats.com", phone: "3333333333")
        expect(user).to be_invalid
      end

      it "is invalid without a phone number" do
        user = User.new(name: "Bob", username: "bob", email: "cats@cats.com", password: "password")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        user = create(:user)
        expect(user).to be_valid
      end
    end

    context "uniqueness" do
      it "has a unique email" do
        user1 = create(:user)
        user2 = User.new(name: "Steve", username: "steve", email: user1.email, password: "dogs", phone: "1111111111")
        expect(user2).to be_invalid
      end

      it "has a unique username" do
        user1 = create(:user)
        user2 = User.new(name: "Steve", username: user1.username, email: "steve@steve.com", password: "dogs", phone: "1111111111")
        expect(user2).to be_invalid
      end
    end
  end
end
