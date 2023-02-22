require 'rails_helper'

RSpec.describe "AdminPages", type: :request do
  describe "GET /comments" do
    it "returns http success" do
      test_user
      get "/admin/comment"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /articles" do
    it "returns http success" do
      test_user
      get "/admin"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      test_user
      get "/admin/user"
      expect(response).to have_http_status(:success)
    end
  end

  def test_user
    User.create(name: "Test", email: "test@example.com", password: "111111", admin: true)
    visit new_user_session_path
    fill_in :user_email, with: "test@example.com"
    fill_in :user_password, with: "111111"
    click_button "Log in"
  end
end
