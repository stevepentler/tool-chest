# require 'test_helper'

# class InvalidParamatersDuringAccountCreationTest < ActionDispatch::IntegrationTest
#   test "invalid username does not create account" do
#     visit new_user_path

#     fill_in :password, with: "Phoenix34Suns"

#     click_on "Create Account"

#     assert page.has_content?("Invalid Account!")
#     assert_equal new_user_path, current_path
#   end
# end
