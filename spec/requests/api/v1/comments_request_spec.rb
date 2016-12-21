require 'rails_helper'

describe "pins comments endpoints" do
  context "GET pins/comments?pin_id" do
    it "returns a collection of comments" do
      user = create(:user, api_key: "1234567")
      pin = create(:pin)
      create_list(:comment, 3, pin_id: pin.id)

      get "/api/v1/comments?pin_id=#{pin.id}&api_key=#{user.api_key}"

      pin_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(pin_json.first["pin_id"]).to eq(pin.id)
    end
  end

  context "POST pins/comments?pin_id" do
    it "Adds a comment to the pin" do
      user = create(:user, api_key: "1234567")
      pin = create(:pin)

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/comments?pin_id=#{pin.id}&api_key=#{user.api_key}", {	"comment": {	"content": "Hello World"	}}, headers

      pin_json = JSON.parse(response.body)
      expect(pin_json["pin_id"]).to eq(pin.id)
      expect(pin_json["content"]).to eq("Hello World")
    end
  end
end
