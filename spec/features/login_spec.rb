require 'rails_helper'

RSpec.feature "create user", type: :feature do
	it "a new user sesion" do
	    User.create(name:"Test", email:"test@gmail.com", password:"111111")
	    visit new_user_session_path
	    fill_in :user_email, with: "test@gmail.com"
	    fill_in :user_password, with: "111111"
	    click_button "Log in"
	end
end