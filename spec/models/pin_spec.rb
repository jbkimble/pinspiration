require 'rails_helper'

RSpec.describe Pin, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        pin = Pin.new(image: "image.src", source: "source")
        expect(pin).to be_invalid
      end
      it "is invalid without an image" do
        pin = Pin.new(name: "cool pin", source: "source")
        expect(pin).to be_invalid
      end
      it "is invalid without a source" do
        pin = Pin.new(image: "image.src", name: "cool pin")
        expect(pin).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with all attributes" do
        pin = Pin.new(image: "image.src", name: "cool pin", source: "source")
        expect(pin).to be_valid
      end
    end
    context "relationships" do
      it "has many boards through pin_boards" do
        pin = create(:pin)
        expect(pin).to respond_to(:boards)
        expect(pin).to respond_to(:pin_boards)
      end
      it "has many comments" do
        pin = create(:pin)
        expect(pin).to respond_to(:comments)
      end
    end
  end

end
