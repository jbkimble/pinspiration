require 'rails_helper'

describe "pins comments endpoints" do
  context "pins/:id/comments" do
    it "returns a collection of comments" do
      pin = create(:pin)
      create_list(:comment, 3, pin_id: pin.id)

      get "/api/v1/comments?pin_id=#{pin.id}"

      pin_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(pin_json.first["pin_id"]).to eq(pin.id)
    end
  end
end
