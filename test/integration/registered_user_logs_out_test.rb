require 'test_helper'

class RegisteredUserLogsOutTest < ActionDispatch::IntegrationTest
  test "registered user logs out" do
    visit login_path
    @user = User.create(username: "Charles Barkley", password: "34PhoenixSuns")
    fill_in "Username", with: @user.username 
    fill_in "Password", with: "34PhoenixSuns"
    click_on "Login"
    visit user_tools_path(@user)


    click_on "Logout"

    assert_equal login_path, current_path
    assert page.has_content?("Logged Out!")
    refute page.has_content?("Charles Barkley")
    
  end
end
