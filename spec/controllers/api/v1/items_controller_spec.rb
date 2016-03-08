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
      expect(json_response.first["image_url"]).to eq(items.first.image_url)

      expect(json_response.last["name"]).to eq(items.last.name)
      expect(json_response.last["description"]).to eq(items.last.description)
      expect(json_response.last["image_url"]).to eq(items.last.image_url)

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns specified item in json" do
      item = create(:item)

      get :show, id: item.id, format: :json

      expect(json_response["name"]).to eq(item.name)
      expect(json_response["description"]).to eq(item.description)
      expect(json_response["image_url"]).to eq(item.image_url)

      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE #destroy" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns a 204 json response when an item is deleted" do
      item = create(:item)

      delete :destroy, id: item.id, format: :json

      # expect(json_response["name"]).to eq(item.name)
      # expect(json_response["description"]).to eq(item.description)
      # expect(json_response["image_url"]).to eq(item.image_url)
      # expect(json_response.count).to eq(1)
      # expect(response).to be_success
      expect(response.status).to eq(204)
    end
  end
end
