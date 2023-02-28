module SharedMethods
  def test_admin
    User.create(name: "Lucy", email: "lucy@example.com", password: "111111", admin: true)
  end

  def test_user
    User.create(name: "Tomas", email: "tomas@example.com", password: "111111")
  end

  def log_in(user)
    visit new_user_session_path
    fill_in :user_email, with: user.email
    fill_in :user_password, with: "111111"
    click_button "Log in"
  end
end
