require "rails_helper"
require "shared_methods"

RSpec.feature "create article", type: :feature do
  include SharedMethods

  before do
    log_in(test_user)
  end

  it "creates a new article with valid attributes" do
    visit new_article_path
    fill_in :article_title, with: "My first trip to Alaska"
    fill_in :article_body, with: "dsadsa dasd asd asd as d dsadasd as dasa"
    click_button "Create Article"

    expect(body).to have_content "Alaska"
    expect(body).to have_content "Comments"
  end

  it "creates a new article and comment for it" do
    visit new_article_path
    fill_in :article_title, with: "My first trip to Alaska"
    fill_in :article_body, with: "dsadsa dasd asd asd as d dsadasd as dasa"
    click_button "Create Article"

    fill_in :comment_body, with: "Thanks for sharing!"
    click_button "Create Comment"

    expect(body).to have_content "Tomas"
    expect(body).to have_content "Thanks for sharing"
    expect(body).to have_link "Destroy Comment"
  end
end