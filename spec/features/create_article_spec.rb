require 'rails_helper'

RSpec.feature "create article", type: :feature do
  it 'creates a new article with valid attributes' do
    test_user
    visit new_article_path
    fill_in :article_title, with: "My first trip to Alaska"
    fill_in :article_body, with: "dsadsa dasd asd asd as d dsadasd as dasa"
    click_button "Create Article"

    expect(body).to have_content 'Alaska'
    expect(body).to have_content 'Comments'
  end

  it 'creates a new article and comment for it' do
    test_user
    visit new_article_path
    fill_in :article_title, with: "My first trip to Alaska"
    fill_in :article_body, with: "dsadsa dasd asd asd as d dsadasd as dasa"
    click_button "Create Article"

    fill_in :comment_commenter, with: "John"
    fill_in :comment_body, with: "Thanks for sharing!"
    click_button "Create Comment"

    expect(body).to have_content 'John'
    expect(body).to have_content 'Thanks for sharing'
  end

  def test_user
    User.create(name:"Test", email:"test@gmail.com", password:"111111")
    visit new_user_session_path
    fill_in :user_email, with: "test@gmail.com"
    fill_in :user_password, with: "111111"
    click_button "Log in"
  end
end