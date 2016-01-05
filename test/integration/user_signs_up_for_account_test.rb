require 'test_helper'

class UserSignsUpForAccountTest < ActionDispatch::IntegrationTest

  test "unregistered user creates account" do
    # visit tools_path #to initiate session
    visit new_user_path
# save_and_open_page
    fill_in "Username", with: "Charles Barkley"
    fill_in "Password", with: "34PhoenixSuns"
    click_on "Create Account"

    user = User.last

    assert_equal user_path(user), current_path
    assert page.has_content?("Charles Barkley")
    assert page.has_content?("Account Created!")
    
  end
end
