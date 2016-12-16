require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        role = Role.new()
        expect(role).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        role = Role.new(name: "admin")
        expect(role).to be_valid
      end
    end

    describe "relationships" do
      it "has many user roles" do
        role = create(:role)
        expect(role).to respond_to(:user_roles)
      end

      it "has many users" do
        role = create(:role)
        expect(role).to respond_to(:users)
      end
    end
  end


end
