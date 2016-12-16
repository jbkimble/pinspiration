require 'rails_helper'

RSpec.describe UserRole, type: :model do
  describe "relationships" do
    it "belongs to a user" do
      user_role = create(:user_role)
      expect(user_role).to respond_to(:user)
    end

    it "belongs to a role" do
      user_role = create(:user_role)
      expect(user_role).to respond_to(:role)
    end
  end
end
