require 'test_helper'

class RegisteredUserLoginsInTest < ActionDispatch::IntegrationTest
  test "registered user logs in" do
    @user = User.create(username: "Charles Barkley", password: "34PhoenixSuns")
    visit login_path
    fill_in "Username", with: user.username 
    fill_in "Password", with: "34PhoenixSuns"
    click_on "Login"

    assert_equal user_path(user), current_path
    assert page.has_content?("Charles Barkley")
    assert page.has_content?("Welcome Back!")
  end
end
