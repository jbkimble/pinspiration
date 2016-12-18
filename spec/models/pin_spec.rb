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
      it "has many comments through pin_comments" do
        pin = create(:pin)
        expect(pin).to respond_to(:comments)
        expect(pin).to respond_to(:pin_comments)
      end
    end
  end
  describe "class methods" do
    context ".all_pins_chronologically_by_updated_at" do
      it "sorts the pins chronologically by updated at" do
        last = create(:pin, name:"last")
        middle = create(:pin, name:"middle")
        first = create(:pin, name:"first")

        pins = Pin.all_pins_chronologically_by_updated_at
        expect(pins.first).to eq(first)
        expect(pins.second).to eq(middle)
        expect(pins.last).to eq(last)
      end
    end
  end

end
