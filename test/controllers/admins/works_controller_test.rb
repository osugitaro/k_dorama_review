require "test_helper"

class Admins::WorksControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admins_works_home_url
    assert_response :success
  end
end
