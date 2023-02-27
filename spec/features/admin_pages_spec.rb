require "rails_helper"
RSpec.feature "admin pages", type: :feature do
  it "visit admin articles pages" do
    test_user
    visit new_article_path
    fill_in :article_title, with: "My first trip to Alaska"
    fill_in :article_body, with: "dsadsa dasd asd asd as d dsadasd as dasa"
    click_button "Create Article"
    visit admin_articles_path

    expect(body).to have_content "Admin Articles"
    expect(body).to have_content "My first trip to Alaska"
    expect(body).to have_content "Lucy"
  end

  it "visit admin users pages" do
    test_user
    visit admin_users_path

    expect(body).to have_content "Admin Users"
    expect(body).to have_content "Lucy"
    expect(body).to have_content "lucy@example.com"
  end

  it "visit admin comments pages" do
    test_user
    visit new_article_path
    fill_in :article_title, with: "My first trip to Alaska"
    fill_in :article_body, with: "dsadsa dasd asd asd as d dsadasd as dasa"
    click_button "Create Article"
    fill_in :comment_body, with: "Thanks for sharing!"
    click_button "Create Comment"
    visit admin_comments_path

    expect(body).to have_content "Admin Comments"
    expect(body).to have_content "Lucy"
    expect(body).to have_content "Thanks for sharing!"
  end

  def test_user
    User.create(name: "Lucy", email: "lucy@example.com", password: "111111", admin: true)
    visit new_user_session_path
    fill_in :user_email, with: "lucy@example.com"
    fill_in :user_password, with: "111111"
    click_button "Log in"
  end

  # def test_content
  #   test_user
  #   visit new_article_path
  #   fill_in :article_title, with: "My first trip to Alaska"
  #   fill_in :article_body, with: "dsadsa dasd asd asd as d dsadasd as dasa"
  #   click_button "Create Article"

  #   ill_in :comment_body, with: "Thanks for sharing!"
  #   click_button "Create Comment"
  # end
end
