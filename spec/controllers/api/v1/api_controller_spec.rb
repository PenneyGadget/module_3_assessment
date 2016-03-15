require "rails_helper"

RSpec.describe Api::V1::ApiController, type: :controller do
  describe "GET #index" do
    let(:json_response) { JSON.parse(response.body) }

    it "returns a 200 OK" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
