require 'rails_helper'
RSpec.feature "admin pages", type: :feature do
  it "visit admin articles pages" do
    test_user
    visit admin_articles_path

    expect(body).to have_content 'Admin Articles'
  end

  it "visit admin users pages" do
    test_user
    visit admin_users_path

    expect(body).to have_content 'Admin Users'
  end

  def test_user
    User.create(name: "Test", email: "test@example.com", password: "111111", admin: true)
    visit new_user_session_path
    fill_in :user_email, with: "test@example.com"
    fill_in :user_password, with: "111111"
    click_button "Log in"
  end
end
