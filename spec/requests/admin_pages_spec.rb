require 'rails_helper'

RSpec.describe "AdminPages", type: :request do
  describe "GET /comments" do
    it "returns http success" do
      get "/admin/comment"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /articles" do
    it "returns http success" do
      get "/admin/article"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      get "/admin/user"
      expect(response).to have_http_status(:success)
    end
  end
end
