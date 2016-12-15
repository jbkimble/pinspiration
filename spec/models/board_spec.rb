require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        user = create(:user)
        board = Board.new(user_id: user.id)
        expect(board).to be_invalid
      end
      it "is invalid without user" do
        board = Board.new(name: "Board Name")

        expect(board).to be_invalid
      end
      it "is valid with all attributes" do
        user = create(:user)
        board = Board.new(name: "Board Name", user_id: user.id)

        expect(board).to be_valid
      end
    end
    context "relationships" do
      it "belongs to a user" do
        board = create(:board)
        expect(board).to respond_to(:user)
      end
    end
  end
end
