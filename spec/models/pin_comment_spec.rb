require 'rails_helper'

RSpec.describe PinComment, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a pin_id" do
        comment = create(:comment)
        pin_comment = PinComment.new(comment_id: comment.id)
        expect(pin_comment).to be_invalid
      end
      it "is invalid without a comment_id" do
        pin = create(:pin)
        pin_comment = PinComment.new(pin_id: pin.id)
        expect(pin_comment).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with pin_id and comment_id" do
        pin = create(:pin)
        comment = create(:comment)
        pin_comment = PinComment.new(pin_id: pin.id, comment_id: comment.id)
        expect(pin_comment).to be_valid
      end
    end
    context "relationships" do
      it "belongs to a pin" do
        pin_comment = create(:pin_comment)
        expect(pin_comment).to respond_to(:pin)
      end
      it "belongs to a comment" do
        pin_comment = create(:pin_comment)
        expect(pin_comment).to respond_to(:comment)
      end
    end
  end
end
