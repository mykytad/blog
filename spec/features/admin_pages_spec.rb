require "rails_helper"
require "shared_methods"

RSpec.feature "admin pages", type: :feature do
  include SharedMethods

  before do
    log_in(test_admin)
  end

  it "visit admin articles pages" do
    test_article

    visit admin_articles_path

    expect(body).to have_content "Admin Articles"
    expect(body).to have_content "My first trip to Alaska"
    expect(body).to have_content "Tomas"
  end

  it "visit admin users pages" do
    visit admin_users_path

    expect(body).to have_content "Admin Users"
    expect(body).to have_content "Lucy"
    expect(body).to have_content "lucy@example.com"
  end

  it "visit admin comments pages" do
    test_comment

    visit admin_comments_path

    expect(body).to have_content "Admin Comments"
    expect(body).to have_content "Tomas"
    expect(body).to have_content "Thanks for sharing!"
  end

  def test_article
    Article.create(title: "My first trip to Alaska", body: "dsadsa dasd asd asd as d dsadasd as dasa", status: "public", user_id: test_user.id)
  end

  def test_comment
    article = test_article
    Comment.create(body: "Thanks for sharing!", article_id: article.id, status: "public", user_id: article.user_id)
  end
end
