require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns a 200 OK" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "returns all items in json format with only name, desc, and image url" do
      items = create_list(:item, 3)

      get :index, format: :json

      expect(json_response.first["name"]).to eq(items.first.name)
      expect(json_response.first["description"]).to eq(items.first.description)
      expect(json_response.last["image_url"]).to eq(items.last.image_url)
      expect(json_response.count).to eq(3)
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
