require 'rails_helper'

RSpec.describe "Cares", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/cares/index"
      expect(response).to have_http_status(:success)
    end
  end
end
