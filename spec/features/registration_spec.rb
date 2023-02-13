require 'rails_helper'

RSpec.feature "create user", type: :feature do
	it "a new user registration" do
		visit new_user_registration_path
		fill_in :user_name, with: "Tomas"
	    fill_in :user_email, with: "test@gmail.com"
	    fill_in :user_password, with: "111111"
	    fill_in :user_password_confirmation, with: "111111"
	    click_button "Sign up"
	    click_link "Profile"	    

    	expect(body).to have_link 'Log Out'
    	expect(body).to have_link 'Setting'
    	expect(body).to have_content 'Tomas'

	end
end