require 'test_helper'

class AdminToolsTest < ActionDispatch::IntegrationTest
  test "logged in admin sees tools index" do
    admin = User.create(
      username: "admin",
      password: "password",
      role:     1 #identifies user as an admin
      )
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
     #fakes out so that current_user == admin created above
     #stubs comes from a library, gem 'mocha', require 'mocha/mini_test' in test_helper unless using RSpec
     #lasts for one test
    # admin.stubs(:role).return(6) - can use for other examples

    visit admin_tools_path

    assert page.has_content?("Tools Index")
  end

  test 'default user does not see admin tools index' do
    user = User.create(username: "default_user",
                        password: "password",
                        role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_tools_path
    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end