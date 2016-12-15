require 'rails_helper'

RSpec.describe PinBoard, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a pin_id" do
        board = create(:board)
        pin_board = PinBoard.new(board_id: board.id)
        expect(pin_board).to be_invalid
      end
      it "is invalid without a board_id" do
        pin = create(:pin)
        pin_board = PinBoard.new(pin_id: pin.id)
        expect(pin_board).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with pin_id and board_id" do
        pin = create(:pin)
        board = create(:board)
        pin_board = PinBoard.new(pin_id: pin.id, board_id: board.id)
        expect(pin_board).to be_valid
      end
    end
    context "relationships" do
      it "belongs to a pin" do
        pin_board = create(:pin_board)
        expect(pin_board).to respond_to(:pin)
      end
      it "belongs to a board" do
        pin_board = create(:pin_board)
        expect(pin_board).to respond_to(:board)
      end
    end
  end
end
