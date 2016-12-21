require 'rails_helper'

describe "comments endpoints" do
  context "GET /comments?pin_id" do
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

  context "POST /comments?pin_id" do
    it "Adds a comment to the pin" do
      user = create(:user, api_key: "1234567")
      pin = create(:pin)

      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/comments?pin_id=#{pin.id}&api_key=#{user.api_key}", '{	"comment": {	"content": "Hello World"	}}', headers

      pin_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(pin_json["pin_id"]).to eq(pin.id)
      expect(pin_json["content"]).to eq("Hello World")
    end
  end

  context "PUT /comments?id" do
    it "Edits a specific comment" do
      user = create(:user, api_key: "1234567")
      comment = create(:comment, content: "Stuff and things", user: user)

      headers = { "CONTENT_TYPE" => "application/json" }
      put "/api/v1/comments?id=#{comment.id}&api_key=#{user.api_key}", '{	"comment": {	"content": "Hello World"	}}', headers

      pin_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(pin_json["id"]).to eq(comment.id)
      expect(pin_json["content"]).to eq("Hello World")
      expect(pin_json["content"]).to_not eq("Stuff and things")
    end
  end

  context "DELETE /comments?id" do
    it "Deletes a specific comment" do
      user = create(:user, api_key: "1234567")
      pin = create(:pin)
      comment1 = create(:comment, user: user, pin_id: pin.id)
      comment2 = create(:comment, content: "Stuff and things", user: user, pin_id: pin.id)

      get "/api/v1/comments?pin_id=#{pin.id}&api_key=#{user.api_key}"

      pin_json = JSON.parse(response.body)

      expect(pin_json.count).to eq(2)
      expect(pin_json.first["id"]).to eq(comment1.id)
      expect(pin_json.last["id"]).to eq(comment2.id)

      delete "/api/v1/comments?id=#{comment2.id}&api_key=#{user.api_key}"

      pin_json = JSON.parse(response.body)

      expect(response).to be_success
      expect(pin_json.count).to eq(1)
      expect(pin_json.first["id"]).to eq(comment1.id)
      expect(pin_json.last["id"]).to eq(comment1.id)
    end
  end
end
