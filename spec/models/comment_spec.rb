require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        user = create(:user)
        comment = Comment.new(user_id: user.id)
        expect(comment).to be_invalid
      end
      it "is invalid without user_id" do
        comment = Comment.new(content: "this is content")
        expect(comment).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        user = create(:user)
        pin = create(:pin)
        comment = Comment.new(content: "content", user_id: user.id, pin_id: pin.id)
        expect(comment).to be_valid
      end
    end
    context "relationships" do
      it "belongs to a user" do
        comment = create(:comment)
        expect(comment).to respond_to(:user)
      end
    end
  end
end
